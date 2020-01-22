FROM debian:buster-slim

ENV MOUNT_PATH /gcssyncbucket/mnt
WORKDIR /gcssyncbucket

# Install helper packages
RUN apt-get update && apt-get install -y lsb-release curl gnupg2 rsync

# Add gcfuse key to APT
RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` \
    && echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN apt-get update && apt-get install -y gcsfuse

RUN apt-get clean

COPY syncbucket.sh .

RUN chmod 0555 syncbucket.sh

ENTRYPOINT [ "/bin/sh", "-ecx", "/gcssyncbucket/syncbucket.sh" ]