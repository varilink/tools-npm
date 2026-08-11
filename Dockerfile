FROM node
LABEL maintainer="david.williamson@varilink.co.uk"

USER node
WORKDIR /workdir/

ENTRYPOINT [ "sh", "-c", "exec" ]
