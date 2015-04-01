FROM inspectit/jboss:5
MAINTAINER info.inspectit@novatec-gmbh.de

#copy nessesary files and deplay dvdstore application
RUN mkdir -p /database/database

COPY h2.jar /database/
RUN ln -s /database/h2.jar /jboss-5.1.0.GA/server/default/lib/.
COPY dvdstore22.h2.db /database/database/
COPY dvdstore22.trace.db /database/database/
COPY dvdstore.ear /jboss-5.1.0.GA/server/default/deploy/
COPY dvdstore-ds.xml /jboss-5.1.0.GA/server/default/deploy/

#copy start script
COPY run-with-inspectit.sh /run-with-inspectit.sh

#define VOLUME for active agent config
VOLUME ["/opt/agent/active-config"]

EXPOSE 8080

# define default command
CMD ["/run-with-inspectit.sh"]
