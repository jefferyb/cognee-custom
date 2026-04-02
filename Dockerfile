FROM cognee/cognee:main

RUN python -m pip install --no-cache-dir \
    google-auth \
    google-cloud-aiplatform \
    pyasn1-modules \
    rsa \
    cachetools
