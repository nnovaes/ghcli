FROM alpine:latest

LABEL maintainer Norman Novaes <novaes+docker@mailbox.org>

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*



VOLUME /ghcli
WORKDIR /ghcli
ENV gitcli_version=1.4.0
RUN wget https://github.com/cli/cli/releases/download/v${gitcli_version}/gh_${gitcli_version}_linux_386.tar.gz -O ghcli.tar.gz
RUN echo "cc4ed23c92933f8823537b2bed98f182057f8c5545b9e6a417d3d459db757438 ghcli.tar.gz" | sha256sum -c -s
RUN tar --strip-components=1 -xf ghcli.tar.gz


ENTRYPOINT ["bin/gh"]
CMD ["--help"]