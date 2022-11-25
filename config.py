import os
from defaults import DefaultConfig


class ProductionConfig(DefaultConfig):
    SECRET_KEY = os.environ.get('SECRET_KEY')

    TWITTER_CONSUMER_KEY = os.environ.get('TWITTER_CONSUMER_KEY', '')
    TWITTER_CONSUMER_SECRET = os.environ.get('TWITTER_CONSUMER_SECRET', '')

    INSTAGRAM_CLIENT_ID = os.environ.get('INSTAGRAM_CLIENT_ID', '')
    INSTAGRAM_SECRET = os.environ.get('INSTAGRAM_SECRET', '')

    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI')

    MAX_MESSAGES_PER_RUN = os.environ.get('MAX_MESSAGES_PER_RUN', 5)
    TRUST_PROXY_HEADERS = os.environ.get('TRUST_PROXY_HEADERS', False)
