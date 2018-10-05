# Symfony 4.1 Docker setup
This project provides a complete stack to easily start developing a Symfony 4.1 project using Docker.  
It has a database (MySQL), phpMyAdmin, SMTP server for development with web interface (Maildev) and allows using Xdebug.

## Installation and Setup
First, clone the repository and enter the project folder:
```bash
$ git clone git@github.com:pjam/docker-symfony4-mysql.git
$ cd docker-symfony4-mysql
```

Then, create and build all the needed images and containers and start them
```bash
bin/docker build
bin/docker start
```

After the images finish building and the containers, you should be able to see the 
Symfony welcome page in your browser at
```
http://localhost:8080
```

You can also access phpMyAdmin and the Maildev web interface, respectively at:
```
http://localhost:8000
http://localhost:8001
```

## Usage/Commands

### Docker
```bash
# Build images
$ bin/docker build

# Start the containers
$ bin/docker start

# Stop the containers
$ bin/docker stop
```

### CLI
```bash
# Access the Container Shell
$ bin/cli
```

### Console
```bash
# You can run Symfony console commands without entering the container
# For example, create an entity:
$ bin/console make:entity
```

### Composer
```bash
# To install/updates packages in your projects without having to install Composer on your machine
# use the composer script:
$ bin/composer require symfony/webpack-encore-pack
```

### xdebug
```bash
# enable xdebug
$ bin/xdebug enable

# disable xdebug
$ bin/xdebug disable
```

For a complete list of available commands, go [here](bin/README.md).

## Remarks
* This project is intended for development. It is not prepared for production
* Tested on Ubuntu 16.04 and Windows 10 with Ubuntu linux subsystem, with Docker 18.06
* Feel free to improve it on your own or even contribute, with your pull requests