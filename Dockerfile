FROM python:3.7 AS builder

RUN pip install --user pipenv

# Tell pipenv to create venv in the current directory
ENV PIPENV_VENV_IN_PROJECT=1

# Pipefile contains requests
ADD moa /usr/src/app

WORKDIR /usr/src/app

RUN /root/.local/bin/pipenv install && \
    /root/.local/bin/pipenv install gunicorn[gevent]


FROM python:3.7 AS runtime

RUN adduser -q --disabled-password --uid 1000 --gecos "moa,,," moa
RUN mkdir -p /usr/src/app/venv
COPY --from=builder /usr/src/app/.venv/ /usr/src/app/.venv/
# not really needed by good to see the locked dependencies
COPY --from=builder /usr/src/app/Pipfile.lock /usr/src/app/Pipfile.lock

WORKDIR /usr/src/app

ADD moa /usr/src/app
ADD config.py /usr/src/app/config.py

RUN chown -R moa:moa /usr/src/app

USER moa

ENV MOA_CONFIG="config.ProductionConfig"
CMD ["/usr/src/app/.venv/bin/python", "app.py"]

EXPOSE 5000
