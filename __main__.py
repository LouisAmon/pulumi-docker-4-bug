import pulumi_docker as docker

docker = docker.Image(
    "my-image",
    image_name="test",
    skip_push=True,
    build=docker.DockerBuildArgs(platform="linux/arm64"),
)
