FROM debian:bullseye
LABEL maintainer="david.williamson@varilink.co.uk"

RUN                                                                            \
  apt-get update                                                            && \
  apt-get install --no-install-recommends --yes                                \
    curl                                                                       \
    software-properties-common                                              && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash -                   && \
  apt-get install --no-install-recommends --yes nodejs

WORKDIR /

ENTRYPOINT [ "/usr/bin/npm" ]
