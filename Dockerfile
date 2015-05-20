FROM inspectit/jboss:5
MAINTAINER info.inspectit@novatec-gmbh.de

ENV PROJECT_NAME dvdstore

#copy nessesary files and deplay dvdstore application
RUN mkdir -p /database/database \
&& mkdir -p /opt/agent/active-config

WORKDIR /opt

RUN wget ftp://ntftp.novatec-gmbh.de/inspectit/samples/sample-dvdstore/${PROJECT_NAME}.zip \
&& unzip ${PROJECT_NAME}.zip \
&& mv h2.jar /database/ \
&& ln -s /database/h2.jar /jboss-5.1.0.GA/server/default/lib/. \
&& mv dvdstore22.h2.db /database/database/ \
&& mv dvdstore22.trace.db /database/database/ \
&& mv dvdstore.ear /jboss-5.1.0.GA/server/default/deploy/ \
&& mv dvdstore-prod-ds.xml /jboss-5.1.0.GA/server/default/deploy/dvdstore-ds.xml \
&& mv inspectit-agent.cfg /opt/agent/config \
&& mv dvdstore-*.cfg /opt/agent/config/common \
&& rm -f ${PROJECT_NAME}.zip

#copy start script
COPY run-with-inspectit.sh /run-with-inspectit.sh

EXPOSE 8080

# define default command
CMD ["/run-with-inspectit.sh"]
