### Database Server

Connecting the simulator to a databse does not differ much from standard setup specified at [OpenSim Database Settings](http://opensimulator.org/wiki/Database_Settings), excepting by the fact Opensim Engine and DB Server will always reside on different hosts, and will communicate via network. You need to setup both OpenSim config files (a.k.a. DB client) and your DB Server considering this fact.

In many scenarios, you will want (or at least results practical) to run this DB Server inside a container as well. If this is the case, additional Docker setup is needed to ensure a virtual network where both containers can communicate is essential.

Finally, as an up and running DB Server is a pre-requisite for OpenSim to start, it is ideal to create a Stack with Docker Compose or Kubernetes, where the DB takes precedence starting.

Opensim Engine has been tested and runs nice with the [*Official MySQL Docker Images*](https://hub.docker.com/_/mysql) BUT,

*As of OpenSim 0.9.1.1 and based distros, 'latest' MySQL images won't work because have authentication issues, so it is recommended to use 5.7.xx images instead, until OpenSim code is updated for MySQL version 8.*
