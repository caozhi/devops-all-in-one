# Init a Dev env

## Reprequisite Tools

* Eclipse
* Maven
* Docker-ce
* docker-compose
* Git

## Init development environment

### Execute the shell script to init the env

The init_devenv.sh script will clone the webapp codes and init an Eclipse project.

```shell
cd project ## cd the directory your want to init your project
sh init_devenv.sh
```

Import project to your Eclipse, that's it

## Start up your own running boxes

### Configure your project folder in compose file

Modify the {cloned_proj_folder} in docker-compose.yml file to your own project folder. Typically, it's the same folder you cloned your poject above.

### Start up local runtime environment

Then just run docker compose command, it will start up two containers. One is for application server. Another one is for static resources server

```shell
docker-compose up -d
```