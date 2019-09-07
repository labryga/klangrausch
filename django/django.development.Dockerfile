FROM python:3.6-alpine

WORKDIR /klangrausch

ENV PYTHONDONTWRITEBYTECODE = 1
ENV PYTHONUNBUFFERED = 1
RUN apk update && \ 
    apk add shadow && \
    apk add --virtual build-deps gcc python3-dev musl-dev && \
    apk add postgresql-dev && pip install psycopg2

RUN groupadd -g 5432 topos
RUN chown -R root:topos /klangrausch
COPY requierments_development.txt .
RUN pip install -r requierments_development.txt

RUN apk del build-deps
