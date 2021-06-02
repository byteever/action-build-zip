FROM alpine:latest

LABEL "com.github.actions.name"="Create Zip File"
LABEL "com.github.actions.description"="Create a zip file containing specific files from your repository"
LABEL "com.github.actions.icon"="folder-plus"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/byteever/action-build-zip"
LABEL "homepage"="https://github.com/byteever/action-build-zip"
LABEL "maintainer"="byteever <info@byteever.com>"

RUN apk add zip
RUN apk add rsync
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]