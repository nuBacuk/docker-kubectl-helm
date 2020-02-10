FROM alpine:edge

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v3.0.1-linux-amd64.tar.gz"

RUN apk add --no-cache curl git ca-certificates && \
    curl -L ${BASE_URL}/${TAR_FILE} | tar xz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    mv ./kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl && \
    rm -f /var/cache/apk/*
