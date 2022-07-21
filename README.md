# Tools - NPM

David Williamson @ Varilink Computing Ltd

------

A Docker image that implements the npm package manager. Useful for deploying packages using npm into projects. To use this tool, install it into a project as
as submodule and add its docker-compose.yml file to the COMPOSE_FILE environment
variable. You can then do things like this:

```bash
docker-compose run --rm npm install bootstrap@4.5.3
```

Packages will be installed in the node_modules folder within the project. Create
this folder first before running this tool.
