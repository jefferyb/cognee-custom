FROM cognee/cognee:main

RUN pip install --target /app/.venv/lib/python3.12/site-packages \
    --no-cache-dir \
    google-auth \
    google-cloud-aiplatform \
    pyasn1-modules \
    rsa \
    cachetools
