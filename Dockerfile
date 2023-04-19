FROM python:alpine AS base

FROM base as run
ADD projects/api/src src

CMD ["python", "-m", "src.foo"]