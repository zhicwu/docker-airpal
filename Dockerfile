#
# This docker image is just for development and testing purpose - please do NOT use on production
#

# Pull Base Image
FROM zhicwu/java:8

# Set Maintainer Details
MAINTAINER Zhichun Wu <zhicwu@gmail.com>

# Set Environment Variables
ENV AIRPAL_VERSION=0.1 AIRPAL_HOME=/airpal

# Install Prerequisites and Download Airpal
RUN apt-get update \
	&& apt-get install -y build-essential git gradle python \
	&& git clone https://github.com/airbnb/airpal.git \
	&& rm -rf /var/lib/apt/lists/*

# Build and Configure AirPal
# according to https://github.com/airbnb/airpal/issues/145, remove -Dairpal.prestoVersion=${PRESTO_VERSION} is the only way to build successfully
# this means we have to compile Airpal using Presto 0.77 libs...
RUN cd $AIRPAL_HOME \
	&& ./gradlew clean shadowJar \
	&& cp reference.example.yml reference.yml \
	&& cd -

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY airpal /usr/sbin/airpal

RUN chmod +x /docker-entrypoint.sh /usr/sbin/airpal

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8081 8082

CMD ["airpal", "server", "reference.yml"]