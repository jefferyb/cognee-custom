# cognee-custom

Custom [Cognee](https://github.com/topoteretes/cognee) Docker image with Google Cloud Platform packages pre-installed for Vertex AI integration.

## What This Does

Extends the official `cognee/cognee:main` image by adding:

- `google-auth`
- `google-cloud-aiplatform`
- `pyasn1-modules`
- `rsa`
- `cachetools`

These packages enable Cognee to use **Google Vertex AI** as the LLM and embedding provider via [LiteLLM](https://docs.litellm.ai/docs/providers/vertex).

## Image

```
ghcr.io/jefferyb/cognee-custom:latest
```

## Automated Builds

A GitHub Actions workflow rebuilds the image:

- **Daily** at 06:00 UTC -- checks if the upstream `cognee/cognee:main` digest has changed
- **On push** to `main` -- when the Dockerfile or workflow is updated
- **Manual** -- via `workflow_dispatch`

Builds are skipped if the upstream image hasn't changed (digest comparison).

## Usage

```yaml
# docker-compose.yml
services:
  cognee-backend:
    image: ghcr.io/jefferyb/cognee-custom:latest
    environment:
      LLM_PROVIDER: "custom"
      LLM_MODEL: "vertex_ai/gemini-2.5-flash-lite"
      EMBEDDING_PROVIDER: "custom"
      EMBEDDING_MODEL: "vertex_ai/text-embedding-005"
      GOOGLE_APPLICATION_CREDENTIALS: "/var/run/secrets/gcp/key.json"
      VERTEXAI_PROJECT: "your-gcp-project"
      VERTEXAI_LOCATION: "us-central1"
    volumes:
      - ./gcp-sa-key.json:/var/run/secrets/gcp/key.json:ro
```

## License

This repository only contains a Dockerfile and CI configuration. Cognee itself is licensed under its [own terms](https://github.com/topoteretes/cognee/blob/main/LICENSE).
