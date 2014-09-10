Logstash 1.4.x image for ClusterHQ's flocker tutorial.

This container expects to be linked to an elasticsearch (alias ``es``) container (such as clusterhq/elasticsearch) that exposes port 9200.

It listens on port TCP 5000, for lines of JSON.
