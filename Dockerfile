FROM mcr.microsoft.com/powershell:6.2.1-alpine-3.8

LABEL org.label-schema.maintainer="Jakub <Ash258> Čábera <cabera.jakub@gmail.com>" \
      org.label-schema.description="Universal image for scoop repositories." \
      org.label-schema.url="https://github.com/Ash258/Scoop-GithubActions" \
      org.label-schema.vcs-url="https://github.com/Ash258/Scoop-GithubActions" \
      org.label-schema.schema-version="1.0.0"

RUN apk add --no-cache --virtual .scoop-deps git \
    && apk add hub --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && git clone 'https://github.com/lukesampson/scoop.git' '/SCOOP'

COPY Entrypoint.ps1 /Entrypoint.ps1

ENTRYPOINT [ "pwsh", "/Entrypoint.ps1" ]