FROM debian:bullseye
LABEL maintainer="david.williamson@varilink.co.uk"
ARG UID=1000

RUN                                                                            \
  apt-get update                                                            && \
  apt-get install --no-install-recommends --yes                                \
    curl                                                                       \
    software-properties-common                                              && \
  curl -sL https://deb.nodesource.com/setup_18.x | bash -                   && \
  apt-get install --no-install-recommends --yes nodejs                      && \
  npm install -g npm@9.3.1                                                  && \
  useradd --create-home --uid ${UID} npm

USER ${UID}
WORKDIR /home/npm

ENTRYPOINT [ "/usr/bin/npm" ]
