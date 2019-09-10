FROM python:3.6-alpine as base

FROM base as builder

RUN mkdir /install 
WORKDIR /install
COPY requierments_development.txt .

ENV PYTHONDONTWRITEBYTECODE = 1
ENV PYTHONUNBUFFERED = 1
RUN apk update && \ 
    apk add --virtual \
    build-deps gcc python3-dev \
    musl-dev \
    postgresql-dev && \
    pip install --install-option="--prefix=/install" \
    -r requierments_development.txt

RUN apk del build-deps python3-dev gcc musl-dev \
    postgresql-dev

FROM base
COPY --from=builder /install /usr/local
RUN apk --no-cache add libpq
WORKDIR /klangrausch

# RUN groupadd -g 5432 topos
# RUN chown -R root:topos /klangrausch
# apk add shadow && \
