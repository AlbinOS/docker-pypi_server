FROM python:3-alpine
MAINTAINER Albin Gilles <gilles.albin@gmail.com>
ENV REFRESHED_AT 2016-09-04

# Install the server
RUN ["pip", "install", "-U", "pypiserver"]
RUN ["pip", "install" , "-U", "passlib"]

# Data directory
RUN mkdir -p /data/packages
WORKDIR /data
VOLUME ["/data"]

# Run baby run !
ENTRYPOINT ["pypi-server"]
CMD ["-p", "80", "--passwords", "/data/.htpasswd", "packages"]
EXPOSE 80
