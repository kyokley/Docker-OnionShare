ARG BASE_IMAGE=python:3.9-slim

FROM ${BASE_IMAGE} AS builder
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip onionshare-cli


FROM ${BASE_IMAGE} AS base
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /files

RUN apt-get update && apt-get install -y --no-install-recommends \
        tor

RUN pip install --upgrade pip

COPY --from=builder /venv /venv

ENTRYPOINT ["onionshare-cli", "--data-dir", "/files"]
