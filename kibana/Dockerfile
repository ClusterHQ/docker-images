FROM fedora:20
RUN ["yum", "install", "-y", "python-twisted"]
ADD https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz /tmp/
RUN ["mkdir", "-p", "/web/"]
RUN ["tar", "-C", "/web", "-xf", "/tmp/kibana-3.1.0.tar.gz"]
RUN ["rm", "-f", "/tmp/kibana-3.1.0.tar.gz"]

CMD ["/usr/bin/twistd", "-n", "web", "--path", "/web/kibana-3.1.0"]

# HTTP interface
EXPOSE 8080
