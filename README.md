# Repro pulumi-docker 4.x bug

This repo is a minimal reproduction of a bug in pulumi-docker 4.x.

## Steps to reproduce

1. Clone this repo
2. Run `pulumi up`
3. Alter [foo.py](projects/api/src/foo.py) and replace "bar" with "baz"
4. Run `pulumi up` again

## Expected behavior

Pulumi should show a diff on the image and update the image.

## Actual behavior

No diff. The image is not updated.

## Checking with Docker

You can follow these steps to verify that Docker does pick up the changes:

```bash
docker build -t pulumi-docker-bug .
docker run --rm -it pulumi-docker-bug
```

Should initally print "bar".

Then edit [foo.py](projects/api/src/foo.py) and replace "bar" with "baz" again.

```bash
docker build -t pulumi-docker-bug .
docker run --rm -it pulumi-docker-bug
```

Should print "baz".
