FROM python:3.6-slim

RUN pip install 'elasticsearch-curator==4.2.6'
COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
