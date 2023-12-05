FROM alpine:latest

RUN apk add wget \
  && adduser -S app \
  && mkdir /data \
  && chown app /data

COPY --chown=app bootstrap.sh /bootstrap.sh

RUN chmod +x /bootstrap.sh

USER app

EXPOSE 8080
VOLUME /data

ENTRYPOINT ["sh", "bootstrap.sh"]