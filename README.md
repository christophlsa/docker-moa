# Docker Image for moa (Work in Progress)

## Build image
    git clone https://gitlab.com/fedstoa/moa.git moa
    docker build -t moa --pull .

You can also use the docker image `ghcr.io/christophlsa/moa:latest` but this can be outdated.

## Run moa

Check the README of [fedstoa/moa](https://gitlab.com/fedstoa/moa) for exact details.

1. Take the `docker-compose.yml` and adjust the config parameters (create twitter app).
2. Create models:
```
docker-compose -f docker-compose.yml -p moa run --rm -e MOA_CONFIG=ProductionConfig moa /usr/src/app/.venv/bin/python -m moa.models
```
3. Start with docker-compose:
```
docker-compose -f docker-compose.yml -p moa up -d
```

## TODOs

- Worker exists - run in loop?
