FROM alpine:3.19.6
RUN apk --update add postgresql-client && rm -rf /var/cache/apk/*
COPY . /
ENTRYPOINT ["./entrypoint.sh"]
