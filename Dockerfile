FROM node:24-alpine

ARG IMAGE_CREATE_DATE
ARG IMAGE_VERSION
ARG IMAGE_SOURCE_REVISION

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="Hello Kubernetes!" \
      org.opencontainers.image.description="Provides a demo image to deploy to a Kubernetes cluster. It displays a message, the name of the pod and details of the node it is deployed to." \
      org.opencontainers.image.created=$IMAGE_CREATE_DATE \
      org.opencontainers.image.version=$IMAGE_VERSION \
      org.opencontainers.image.authors="Jose Hidalgo" \
      org.opencontainers.image.url="https://hub.docker.com/r/jhidalgo3/hello-kubernetes/" \
      org.opencontainers.image.documentation="https://github.com/jhidalgo3/hello-kubernetes/README.md" \
      org.opencontainers.image.vendor="Jose Hidalgo" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/jhidalgo3/hello-kubernetes.git" \
      org.opencontainers.image.revision=$IMAGE_SOURCE_REVISION 

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY app/package.json /usr/src/app/
# Install dependencies without running postinstall scripts (e.g., for security or compatibility reasons)
RUN npm install --ignore-scripts

# Bundle app source
COPY ./app /usr/src/app

USER node
CMD [ "npm", "start" ]