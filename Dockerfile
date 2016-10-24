FROM ubuntu:xenial

ENV GOLANG_VERSION 1.7.3
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 508028aac0654e993564b6e2014bf2d4a9751e3b286661b0b0040046cf18028e
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# gcc for cgo
RUN apt-get update && apt-get -y upgrade && \ 
    apt-get install -y curl && \
    mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \
    cd "$GOPATH/src" && \
    curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz && \
    echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - && \
    tar -C /usr/local -xzf golang.tar.gz && \
    rm golang.tar.gz && \
    apt-get purge -y curl && \
    apt-get -y clean && apt-get -y autoclean && apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

WORKDIR $GOPATH
