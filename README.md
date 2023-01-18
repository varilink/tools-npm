# Tools - NPM

David Williamson @ Varilink Computing Ltd

------

A Docker image that implements the npm package manager. Useful for deploying packages using npm into projects. To use this tool:

1. Install it into a project as a submodule.
2. Add the path to its `docker-compose.yml` file to the `COMPOSE_FILE` Docker Compose environment variable.
3. Extend the `npm` service that this tool defines to map the npm project directory within the Docker Compose project that is using this tool to `/home/npm` within the service container, using a `volumes` element.

Here is an example of a `COMPOSE_FILE` setting within a Docker Compose project's `.env` file that implements the second step above:

```
COMPOSE_FILE=docker-compose.yml:tools/npm/docker-compose.yml:tools/proxy/docker-compose.yml:tools/wordpress/docker-compose.yml
```

In this example, the project uses the Varilink `npm`, `proxy` and `wordpress` tools.

Here is an example of extending the `npm` service with a `volumes` element that implements the third step above:

```yaml
npm:

  volumes:
    - ./wordpress:/home/npm
```

In this example, the npm project is at `./wordpress` within the Docker Compose project that uses this tool.

Once you're all set up, you can do things like this:

```bash
docker-compose run --rm npm install bootstrap@4.5.3
docker-compose run --rm npm install sass --save-dev
```

To start installing packages into your npm project.

The `package.json` and `package-lock.json` files and the `node_modules` and `.npm` (npm cache) directories will all be created within the directory that you mapped using the `volumes` element as above. You should use `.gitignore` in your project to ignore the `node_modules` and `.npm` directories.

By default, all the files written back to the Docker host will be written using the `UID` 1000. If that's not the `UID` you require then you can override this value using the `build` element within your project's extension of the `npm` service; for example as follows:

```yaml
npm:

  build:
    args:
      UID: 1001

  volumes:
    - ./wordpress:/home/npm
```

Of course, if the image has already been built and you override the default UID that is uses like this, then you must carry out an explicity build before running it again.

You can extend the `npm` service with an `image` element so that the built image can be referred to by name and so referenced in other Docker Compose services that you define in your project's `docker-compose.yml` file.

For example:

```yaml
npm:

  image: varilink/npm

  volumes:
    - ./wordpress:/home/npm

sass:

  image: varilink/npm

  entrypoint: /node_modules/.bin/sass

  volumes:
    - ./wordpress/node_modules:/node_modules
    - ./wordpress/theme/assets/scss:/scss
    - ./wordpress/theme/assets/css:/css
```

This will expose the binary provied by the `sass` package as a Docker Compose service of the same name for generating CSS files from SCSS files.
