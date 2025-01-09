FROM alpine:3.21.2
RUN apk --update add postgresql-client && rm -rf /var/cache/apk/*
COPY . /
ENTRYPOINT ["./entrypoint.sh"]
