FROM python:3.12-slim

LABEL maintainer="Alex Chaika <manti.by@gmail.com>"

ENV UV_LINK_MODE=copy
ENV UV_PROJECT_ENVIRONMENT=/usr/local

RUN mkdir -p /srv/app/src/ /var/lib/app/static/ /var/lib/app/media/ /var/lib/app/data/ /var/log/app/
RUN useradd -m -s /bin/bash -d /home/manti manti && \
    chown -R manti:manti /srv/app/src/ /var/lib/app/ /var/log/app/

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-editable

USER manti
WORKDIR /srv/app/src/
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

