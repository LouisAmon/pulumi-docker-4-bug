FROM python:alpine AS base

FROM base as ok
ADD ok ok
CMD ["python", "-m", "ok.foo"]

FROM base as not-ok
ADD not-ok/api/src src
CMD ["python", "-m", "src.foo"]