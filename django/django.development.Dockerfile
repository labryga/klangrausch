FROM python:3.10.12-alpine3.18

ARG host_user_name
ARG host_user_id
ENV user_name=$host_user_name
ENV user_id=$host_user_id

WORKDIR /klangrausch
COPY requierments_development.txt .
ENV PYTHONDONTWRITEBYTECODE = 1
ENV PYTHONUNBUFFERED = 1
RUN pip install --upgrade pip && \
    pip install -r requierments_development.txt && \
    apk --no-cache --virtual add vim libpq shadow && \
    adduser -D -H -g "" \
    -u "$user_id" \
    -h "$(pwd)" \
    "$user_name" && \
    chown -R "$user_id":"$user_id" "$(pwd)"
RUN apk del shadow
USER "$user_name"
