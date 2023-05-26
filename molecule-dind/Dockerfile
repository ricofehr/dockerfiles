FROM docker:24.0.1-dind

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache gcc musl-dev libffi-dev
RUN apk add --update --no-cache python3 python3-dev && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN pip3 install ansible==7.5.0 molecule molecule-docker docker ansible-lint flake8

CMD ["/bin/bash"]
