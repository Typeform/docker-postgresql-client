FROM alpine:3.16.7
RUN apk --update add postgresql-client && rm -rf /var/cache/apk/*
COPY . /
ENTRYPOINT ["./entrypoint.sh"]
