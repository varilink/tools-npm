FROM debian:trixie
LABEL maintainer="david.williamson@varilink.co.uk"
ARG UID=1000

RUN                                                                            \
  export DEBIAN_FRONTEND=noninteractive                                     && \
  apt-get update                                                            && \
  apt-get install --no-install-recommends --yes                                \
    npm                                                                     && \
  useradd --create-home --uid ${UID} npm

USER ${UID}

# WORKDIR command creates /npm using the UID just set by the USER command.
# Working in a directory other than that user's home directory keeps the .npm
# cache internal to the container and away from the host machine's filesystem.
WORKDIR /npm
