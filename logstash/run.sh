#!/bin/sh
/opt/logstash/bin/logstash -e "
input {
  tcp {
    port => 5000
    codec => json_lines
  }
}

output {
  elasticsearch {
    host => '$ES_PORT_9200_TCP_ADDR'
    port => $ES_PORT_9200_TCP_PORT
    protocol => 'http'
  }
}"
