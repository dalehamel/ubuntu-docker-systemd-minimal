FROM scratch

ENV container docker
ENV DEBIAN_FRONTEND noninteractive

ADD ubuntu-xenial-core-cloudimg-amd64-root.tar.gz /

# Don't invoke rc.d policy scripts
ADD rc.d-policy-stub /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d

# Do an initial update so we have updated lists for the build
RUN apt-get update

# Install some additional packages to behave more like a standard ubuntu system
RUN apt-get install -y \
  binutils \
  ca-certificates \
  curl \
  dmidecode \
  ubuntu-standard \
  ssh # TEMPORARY

RUN systemctl set-default multi-user.target

# Undo the fake policy-rc.d
RUN rm /usr/sbin/policy-rc.d

# delete all the apt list files since they're big and get stale quickly
RUN rm -rf /var/lib/apt/lists/*
# this forces "apt-get update" in dependent images, which is also good

# enable the universe
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list

RUN locale-gen en_US.UTF-8

RUN systemctl enable ssh.service

CMD ["/sbin/init"]
