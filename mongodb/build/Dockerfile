FROM clusterhq/mongolite
MAINTAINER David Gebler <david.gebler@clusterhq.com>
EXPOSE 27017
VOLUME ["/data/db"]
VOLUME ["/data/log"]
CMD /home/mongodb/mongod --noprealloc --smallfiles
