# Tools - NPM

David Williamson @ Varilink Computing Ltd

------

A Docker image that implements the npm package manager. Useful for deploying packages using npm into projects. To use this tool:

1. Install it into a project as a submodule
2. Add the path to its `docker-compose.yml` file to the `COMPOSE_FILE` Docker Compose environment variable
3. Set the `NPM_PROJECT` Docker Compose environment variable to the relative path of your npm project within your repository

You can then do things like this:

```bash
docker-compose run --rm npm install bootstrap@4.5.3
```

Packages will be installed in the `node_modules` folder at the location indicated by `NPM_PROJECT`. Create this folder first before running this tool.
