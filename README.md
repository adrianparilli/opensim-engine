# OpenSim Engine -- README

## Overwiew:
OpenSim Engine is intended to run OpenSim based simulators in ways it can be accessed and managed easily, and looks to be part of a more elaborated code in order to deploy and configure Sims or Grids automatically, in the Docker way. Commits are welcome!

## Features:
Runs standalone sims/grids, and allows to connect your sims to an existing grid
It can be connected to a database server if needed.

## Content:
- The latest version of Mono
- Unzip, to unpackage many available simulators that come in ZIP format
- GNU Screen, in order to run OpenSim.exe on it, being able to attach / detach the console without close the program.

## Basic Requirements:
- Docker Engine. See [**_Get Docker_**](https://docs.docker.com/get-docker/) for further instructions.
- Your OpenSim based simulator on a folder (a new or existing install)

## Advanced Requirements:

### Database Server
Connecting the simulator to a databse does not differ much from standard setup specified at [**_OpenSim Database Settings_**](http://opensimulator.org/wiki/Database_Settings), excepting by the fact Opensim Engine and DB Server will always reside on different hosts, and will communicate via network. You need to setup both OpenSim config files (a.k.a. DB client) and your DB Server considering this fact.

In many scenarios, you will want (or at least results practical) to run this DB Server inside a container as well. IF this is the case, additional Docker setup to ensure a virtual network where both containers can communicate is essential.

Finally, as an up and running DB Server is a pre-requisite for OpenSim to start, it is ideal to create a Stack with Docker Compose or Kubernetes, where the DB takes precedence starting.

Opensim Engine has been tested and runs nice with [**_Official MySQL Docker Images _**](https://hub.docker.com/_/mysql)

*As of OpenSim 0.9.1.1 and based software (e.g. OSGrid), 'latest' MySQL images won't work (Client will have authentication issues), so it is recommended to use 5.7.xx images instead, until OpenSim code is updated for MySQL version 8.*

Other DB Servers has not been tested, but might work.
