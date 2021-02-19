FROM alpine:latest

LABEL maintainer Norman Novaes <novaes+docker@mailbox.org>

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*



VOLUME /ghcli
WORKDIR /ghcli
ENV gitcli_version=1.6.1
ADD checksums.txt .
RUN wget https://github.com/cli/cli/releases/download/v${gitcli_version}/gh_${gitcli_version}_linux_386.tar.gz -O gh_${gitcli_version}_linux_386.tar.gz && \
     sha256sum -c checksums.txt && \
    mv gh_${gitcli_version}_linux_386.tar.gz / && cd / && \
    tar --strip-components=1 -xf gh_${gitcli_version}_linux_386.tar.gz && \
    rm gh_${gitcli_version}_linux_386.tar.gz


ENTRYPOINT ["/bin/gh"]
CMD ["--help"]