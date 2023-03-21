FROM certbot/certbot

COPY ./dist/certbot-dns-powerdns-*.tar.gz /tmp/dist/

RUN pip3 install /tmp/dist/certbot-dns-powerdns-*.tar.gz

