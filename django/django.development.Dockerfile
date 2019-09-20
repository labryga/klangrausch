FROM python:3.7-alpine as base .

FROM base as builder

RUN mkdir /install 
WORKDIR /install
COPY requierments_development.txt .

ENV PYTHONDONTWRITEBYTECODE = 1
ENV PYTHONUNBUFFERED = 1
RUN apk update && apk add --no-cache --virtual \
    build-deps gcc python3-dev musl-dev postgresql-dev && \
    pip install --install-option="--prefix=/install" \
    -r requierments_development.txt

RUN apk del build-deps python3-dev gcc musl-dev \
    postgresql-dev

FROM base
COPY --from=builder /install /usr/local

ARG host_user_name
ARG host_user_id
ENV user_name=$host_user_name
ENV user_id=$host_user_id
WORKDIR /klangrausch
RUN apk --no-cache --virtual add libpq shadow && \
    adduser -D -H -g "" \
    -u "$user_id" \
    -h "$(pwd)" \
    "$user_name" && \
    chown -R "$user_id":"$user_id" "$(pwd)"
RUN apk del shadow
USER "$user_name"
