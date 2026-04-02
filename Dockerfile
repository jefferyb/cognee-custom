FROM cognee/cognee:main

RUN /app/.venv/bin/pip install --no-cache-dir \
    google-auth \
    google-cloud-aiplatform \
    pyasn1-modules \
    rsa \
    cachetools
