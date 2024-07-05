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
  useradd --create-home --uid ${UID} npm

USER ${UID}

# WORKDIR command creates /npm using the UID just set by the USER command.
# Working in a directory other than that user's home directory keeps the .npm
# cache internal to the container and away from the host machine's filesystem.
WORKDIR /npm
