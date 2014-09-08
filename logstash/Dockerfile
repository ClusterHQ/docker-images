FROM fedora:20
ADD GPG-KEY-elasticsearch /etc/pki/rpm-gpg/
ADD logstash.repo /etc/yum.repos.d/
RUN ["rpm", "--import", "/etc/pki/rpm-gpg/GPG-KEY-elasticsearch"]
# https://github.com/elasticsearch/logstash/pull/1707
RUN ["yum", "install", "-y", "/usr/bin/which"]
RUN ["yum", "install", "-y", "logstash"]

ADD run.sh /usr/local/bin/run
CMD /usr/local/bin/run

EXPOSE 5000
