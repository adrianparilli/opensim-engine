# OpenSim Engine -- Readme

## Overwiew:
OpenSim Engine is intended to run OpenSim based simulators. Its main goal is to be part of a more elaborated solution to deploy simulators and/or grids, but can be used *as is* to test and even run (very simple) configurations inside containers.

## Features:
- Built upon the latest version of Mono
- Contains minimal tools to download and manipulate ZIP compressed binaries inside the container
- It runs OpenSim.exe onto a detachable console you can access the main screen, see status and use CLI.
- Allows both standalone sims/grids (e.g. OpenSim, DivaDistro), and also connect your sims to existing grids (e.g. OSGrid)

NOTE: The image does not provide simulator files, you have to download/uncompress it yourself.

## Requirements:
- Docker Engine. See [Docker Documentation](https://docs.docker.com/get-docker/) for further instructions
- Uncompressed main simulator folder tree, accessible by Docker with write permissions

## Basic Usage
Useful for tests, and also for running very simple configurations (e.g. standalone and/or default SQLite setup):

`docker run \`

`-it --restart=<restart-policy> \`

`--name <container-name> \`

`-v </path-to-main-folder>:/opensim \`

`-p 9XXX[-9YYY]:9XXX[-9YYY]/tcp \`

`-p 9XXX[-9YYY]:9XXX[-9YYY]/udp \`

`adrianparilli/opensim-engine[:<label>]`

Where:
`<restart-policy>`: `no` `on-failure[max-retries]` `unless-stopped` or `always` (see [Restart Policies](https://docs.docker.com/engine/reference/commandline/run/#restart-policies---restart) for more info

`<container-name>`: Name you want to give for this container

`</path-to-main-folder>`: Absolute path to the main simulator folder tree (containing inside 'bin' and 'doc' directories)

`9XXX[-9YYY]:9XXX[-9YYY]`: Port [or ports range] mapped to this container from the host, in order to connect to simulator(s) from your viewer. Both tcp and udp are need to be declared apart.

`label`: If even provisioned, will use a specific version of this image. It should not be needed.

### Example:

`docker run -it --name opensim-test -v /data/docker/opensim:/opensim -p 9000:9000/tcp -p 9000:9000/udp adrianparilli/opensim-engine`

The image will be downloaded and when runs, you will get attached to OpenSim.exe's first run CLI, being able to see the output and send commands to the simulator (e.g. setup, etc.)

To *detach* from the console, simply press `Ctrl+P` and `Ctrl+Q` (or `Ctrl+P+Q`) to exit. The simulator will keep running in background.

To *attach* to this container again: `docker attach <container-name>`

To *start|restart|stop* the container: `docker start|restart|stop <container-name>`
(NOTE: To stop|restart the simulator gracefully, you *must* attach the console and send the `shutdown` command before!)

To *delete* the container with `docker rm <container-name>`. Simulator files will be kept.


From your viewer, you should be able to access your simulator once configured via the local ip or dns name and configured port where Docker is running.
Example: http://localhost:9000


## Advanced Usage
This section is an ongoing work (commits are welcome!). By know, it's useful to mention that by using this image, you will be able to:

- Dump a clean simulator folder tree onto a Docker volume or directly inside the container, and mount just the files you need to manage

- Customize your entire settings firat, and dump either to a volume or inside the container, and run without mounts

- You can add more mount points to import/export files (e.g. terrains, OARs, IARs, etc.)

- You can connect to an existing DB server (e.g. MySQL) and this can be also another container

- You can use this image *to build and deploy your own OpenSim Stack* with Docker composer, Kubernetes, etc.

## To Do

- Create an entrypoint.sh to 'shutdown' the simulator gracefully.
