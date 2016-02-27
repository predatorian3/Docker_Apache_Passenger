#
#
#

FROM centos:latest

MAINTAINER Phillip Dudley version 0.1.0

# Install rbenv

# Install EPEL, Python GPG, and cURL
RUN yum install -y epel-release pygpgme curl

# Download the PassengerFusion YUM Repository
RUN curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo

# Install the Apache Mod, mod_passenger
RUN yum install -y httpd mod_passenger

# Restart httpd if its already running
RUN systemctl restart httpd

# Check if Passenger is working
RUN /usr/bin/passenger-config validate-install

EXPOSE 80