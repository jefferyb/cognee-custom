FROM cognee/cognee:main

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN uv pip install --python /app/.venv/bin/python --no-cache \
    google-auth \
    google-cloud-aiplatform \
    pyasn1-modules \
    rsa \
    cachetools
