FROM openjdk:latest
MAINTAINER Eric Fehr ericfehr@gmail.com
LABEL description="Kubespark-submit docker image"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git-core --no-install-recommends && rm -rf /var/lib/apt/lists/*


RUN useradd -u 1000 -s /bin/bash -d /home/spark -m spark
USER spark
WORKDIR /home/spark
RUN git clone https://github.com/apache-spark-on-k8s/spark
WORKDIR /home/spark/spark
RUN build/./mvn install -Pkubernetes -pl resource-managers/kubernetes/core -am -DskipTests
RUN dev/make-distribution.sh --tgz -Phadoop-2.7 -Pkubernetes

# copy spark-defaults conf
COPY spark-defaults.conf /home/spark/spark-defaults.conf

# launch rails.sh script
ENTRYPOINT ["/home/spark/spark//bin/./spark-submit"]
