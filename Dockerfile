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

# For bind mounting the host directory to act upon
WORKDIR /workdir
