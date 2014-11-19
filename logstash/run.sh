#!/usr/bin/env python

import os

LOGSTASH_BIN = "/opt/logstash/bin/logstash"
LOGSTASH_CONFIG = """\
input {
  tcp {
    port => 5000
    codec => json_lines
  }
}

output {
  elasticsearch {
    host => '%(ES_PORT_9200_TCP_ADDR)s'
    port => %(ES_PORT_9200_TCP_PORT)s
    protocol => 'http'
  }
}
""" % os.environ

os.execv(LOGSTASH_BIN, [LOGSTASH_BIN, '-e', LOGSTASH_CONFIG])
