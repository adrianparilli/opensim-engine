# Name: opensim-engine

FROM mono:latest

MAINTAINER Adrián Parilli <adrianparilli@yahoo.com>
LABEL version="20.11.16" description="Minimal engine to run OpenSim based simulators and access the CLI."

RUN \
apt-get update && \
apt-get install -y screen unzip && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/*

# (First) default ports to allow other users to connect your simulator.
EXPOSE 9000/tcp
EXPOSE 9000/udp

# Default Folder
WORKDIR /opensim/bin/

# Command
CMD ["screen", "mono", "OpenSim.exe"]
