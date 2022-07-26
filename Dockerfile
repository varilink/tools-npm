FROM debian:bullseye
LABEL maintainer="david.williamson@varilink.co.uk"

RUN                                                                            \
  apt-get update                                                            && \
  apt-get install --no-install-recommends --yes                                \
    curl                                                                       \
    software-properties-common                                              && \
  curl -sL https://deb.nodesource.com/setup_14.x | bash -                   && \
  apt-get install --no-install-recommends --yes nodejs

WORKDIR /project

ENTRYPOINT [ "/usr/bin/npm" ]
