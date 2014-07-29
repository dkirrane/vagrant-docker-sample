# Set the base image to https://github.com/phusion/baseimage-docker
# FROM ubuntu
# FROM dockerfile/java
FROM phusion/baseimage:latest

MAINTAINER desmond.kirrane@gmail.com

# Set correct environment variables.
ENV HOME /root

# https://github.com/phusion/baseimage-docker#enabling_the_insecure_key_permanently
RUN /usr/sbin/enable_insecure_key

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*