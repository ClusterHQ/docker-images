Readthedocs Flocker SSL Proxy
=============================

Configuration
-------------

This image does not contain a certificate and private key.
You will need to mount a volume with the `-v` switch to `/ssl/` on the container.

Within the mounted volume, you should have two files (`docs.clusterhq.com.crt` and `docs.clusterhq.com.key` where `docs.clusterhq.com` is the domain).
If you require a CA, you should add this to the end `.crt` file.

When running the container, you will also need to specify the Readthedocs `X-RTD-SLUG` in the environment variable `DOCS`.
The container will determine the hostname from the `.crt` file which exists in the `/ssl/` directory.

The `.crt` file and `.key` file must have the same hostname.


Running the Container
---------------------

Example:

    docker run -d -v /certs/:/ssl/ -p 80:80 -p 443:443 -e "DOCS=flocker" msh100/rtd-https-proxy
