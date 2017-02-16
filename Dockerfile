FROM alpine:3.5

RUN apk --update add python py-setuptools py-pip && \
    pip install --upgrade pip && \
    pip install elasticsearch-curator==4.2.6 && \
    apk del py-pip && \
    rm -rf /var/cache/apk/*


COPY config/curator.yml /root/.curator/curator.yml

ENTRYPOINT ["/usr/bin/curator"]
