FROM python:3.8.5-buster

RUN apt update \
    && apt install -y wget unzip git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

ENV PATH $PATH:/root/.poetry/bin
COPY . /opt/awesome
WORKDIR /opt/awesome

RUN poetry config virtualenvs.create false \
    && poetry install
