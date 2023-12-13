# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:jammy
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

# ------------------------------------------------------------------------------
# Install packages and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends dnsmasq iproute2 supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Prepare runtime configuration
COPY supervisord.conf /etc/supervisord.conf

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 52/udp
EXPOSE 67/udp

# ------------------------------------------------------------------------------
# Define default command
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
