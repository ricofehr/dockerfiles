FROM python:3.11.3-bullseye
MAINTAINER Eric Fehr ricofehr@nextdeploy.io
LABEL description="Ansible with some prerequisites"

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG="en_US.UTF-8"
ARG LC_ALL="en_US.UTF-8"

RUN apt-get update && apt-get install -y sudo rsync && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install ansible ansible-lint molecule molecule-podman yamllint

CMD ["tail", "-f", "/dev/null"]
