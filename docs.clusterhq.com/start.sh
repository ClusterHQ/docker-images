#!/bin/bash
sed -i s/HOSTNAME/`openssl x509 -in /ssl/*.crt -text -noout | grep "Subject: CN=" | cut -d "=" -f 2`/g /etc/nginx/sites-enabled/default
sed -i s/SLUGRPL/`echo $DOCS`/g /etc/nginx/sites-enabled/default

exec nginx