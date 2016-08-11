FROM ubuntu:14.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Update apt-cache
RUN apt-get update

# Install Ansible
RUN apt-get -y install git software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install ansible

# Copy Ansible related files
COPY Ansible/ /

# Run Ansible playbook
RUN ansible-playbook -i "localhost," -c local /playbook.yml

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV POSTFIX_CONF_DIR="/etc/postfix" \
    POSTFIX_MYNETWORKS="127.0.0.0/8"

# Setup volumes
VOLUME ["/var/lib/postfix", "/var/mail", "/var/spool/postfix"]

# Expose ports
EXPOSE 25

# Copy entrypoint script and make executable
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Container start-up
CMD ["docker-entrypoint.sh"]
