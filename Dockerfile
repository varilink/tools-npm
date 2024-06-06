FROM debian:bookworm
LABEL maintainer="david.williamson@varilink.co.uk"
ARG UID=1000

RUN                                                                            \
  apt-get update                                                            && \
  apt-get install --no-install-recommends --yes                                \
    ca-certificates                                                            \
    curl                                                                       \
    gnupg                                                                   && \
  mkdir -p /etc/apt/keyrings                                                && \
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |       \
    gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg                       && \
  NODE_MAJOR=20                                                             && \
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg]                       \
    https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |             \
    tee /etc/apt/sources.list.d/nodesource.list                             && \
  apt-get update                                                            && \
  apt-get install --no-install-recommends --yes                                \
    nodejs                                                                  && \
  useradd --create-home --base-dir / --uid ${UID} npm

USER ${UID}
WORKDIR /npm
