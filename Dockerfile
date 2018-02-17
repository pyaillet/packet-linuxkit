FROM python:2.7-alpine

ENV TERRAFORM_VERSION=0.11.3

ENV TERRAFORM_FILE=terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN apk update && \
    apk add bash curl git jq openssh-client gcc make musl-dev libffi-dev openssl-dev && \
    curl -o /root/$TERRAFORM_FILE https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/$TERRAFORM_FILE

WORKDIR /root

RUN unzip $TERRAFORM_FILE && \
    mv terraform /usr/local/bin && \
    rm $TERRAFORM_FILE && \
    pip2 install ansible

ADD profile /root/.bashrc
ADD ansible.cfg /root/.ansible.cfg

RUN mkdir /root/.ssh

COPY ssh /root/.ssh

RUN chmod 0600 /root/.ssh/id_rsa

WORKDIR /root/app

ENTRYPOINT [ "/bin/bash" ]

