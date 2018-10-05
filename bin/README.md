# Scripts/commands
Here is the full list of the possible commands you use:

### Docker
```bash
# Build images
$ bin/docker build [options]

# Rebuild the images, ignoring cache
$ bin/docker rebuild

# Start the containers
$ bin/docker start [options]

# Stop the containers
$ bin/docker stop

# Stop and remove the containers
$ bin/docker clean [options]
```

### CLI
```bash
# Access the Container Shell
$ bin/cli
```

### Console
```bash
# Run Symfony console commands
$ bin/console <command>
```

### Composer
```bash
# Run composer
$ bin/composer <command> [options]
```

### xdebug
```bash
# enable xdebug
$ bin/xdebug enable

# disable xdebug
$ bin/xdebug disable
```

### PHPUnit
```bash
# Run PHPUnit tests
$ bin/phpunit <command> [options]
```

### Yarn (if you use Node)
```bash
# Run yarn commmands
$ bin/yarn <command> [options]
```
