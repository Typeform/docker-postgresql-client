FROM 567716553783.dkr.ecr.us-east-1.amazonaws.com/alpine:3.8
RUN apk --update add postgresql-client && rm -rf /var/cache/apk/*
COPY . /
ENTRYPOINT ["./entrypoint.sh"]
