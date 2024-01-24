FROM python:3.11

ADD requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt


RUN apt update && \
    apt install curl && \
    apt install git && \
    apt install golang

RUN git clone https://github.com/helm/helm.git && \
    cd helm && \
    make && \
    cp bin/helm /usr/local/bin/helm

RUN curl -sSLO https://dl.k8s.io/release/v1.27.3/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
