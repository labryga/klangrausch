FROM python:3.6-alpine

WORKDIR /klangrausch

ENV PYTHONDONTWRITEBYTECODE = 1
ENV PYTHONUNBUFFERED = 1
RUN apk update && \ 
    apk shadow && \
    apk add --virtual build-deps gcc python3-dev musl-dev && \
    apk add postgresql-dev && pip install psycopg2

RUN groupadd 5432 topos
RUN chmod -R root:topos /klangrausch

RUN apk del build-deps
