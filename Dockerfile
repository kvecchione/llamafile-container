FROM alpine:latest

RUN apk add wget \
  && adduser -S app \
  && mkdir /data \
  && chown app /data

COPY --chown=app entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER app

EXPOSE 8080
VOLUME /data

ENTRYPOINT ["sh", "entrypoint.sh"]