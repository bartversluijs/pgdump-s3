FROM postgres:14.6-alpine

LABEL org.opencontainers.image.authors="bartv@nexelit.io"

RUN apk add --no-cache \
  python3 \
  py3-pip \
  && pip install awscli \
  && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup
COPY pguri.py /usr/local/bin/pguri

CMD /usr/local/bin/entrypoint
