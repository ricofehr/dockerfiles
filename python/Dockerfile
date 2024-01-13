FROM python:3.8
MAINTAINER Eric Fehr ricofehr@nextdeploy.io
LABEL description="Python with jq"

RUN DEBIAN_FRONTEND=noninteractive apt-get update

# Install jq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y jq

CMD ["/bin/bash"]
