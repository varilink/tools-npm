# Tools - Node

David Williamson @ Varilink Computing Ltd

------

This Docker Compose project creates a variant of the official `node` image from the Docker Hub whose image name is `varilink/tools/node`. Compared to the official `node` image, the differences in the `varilink/tools/node` image are:

1. It's entrypoint is `sh -c exec` in anticipation of being passed a command the first argument of which is an executable such as `npm` and `npx` rather than the `Node.js` runtime.

2. It switches into the user `node` whose `UID` is 1000, which matches the `UID` of my login on my Debian desktop environments. This is so that I can write back to a Docker host as myself on my development desktop.

3. It sets a `WORKDIR` that is deliberately not the home directory of the `node` user so that we don't get things like the `.npm` cache directory or shell history written back to the Docker host.

I use this tool in WordPress project repositories to implement client build Docker Compose services that use the `npm` and/or `npx` executables. You can **install** the tool within a WordPress project as follows:

1. Add this repository as a submodule of the WordPress project's repository at the submodule path `tools/node`.

2. Add the path to this tool's `docker-compose.yml` file to the `COMPOSE_FILE` Docker Compose environment variable for the WordPress project.

You can then define Docker Compose services within the WordPress project that implement client build processes for plugins and themes that it defines. A good example of this is the [FoBV - WordPress](https://github.com/varilink/fobv_wordpress) repository. Here as an example is one of the Docker Compose services that is defined by that repository:

```sh
fobv-site-theme-2:
  image: varilink/tools/node
  command: >-
    npm ci &&
    npx webpack &&
    npx sass --no-source-map theme.json.scss theme.json.css
  volumes:
    - ./themes/fobv-site/:/workdir/
```

In this example, the service `fobv-site-theme-2` is one of the client build steps for a custom theme defined by the [FoBV - WordPress](https://github.com/varilink/fobv_wordpress) repository.

Note that The `package.json` and `package-lock.json` files and the `node_modules` directory will all be created within the directory that is mapped using the `volumes` element as above. You should use `.gitignore` in your project to ignore the contents of the `node_modules` directory and any other generated content.

This tool also exposes `npm` and `npx` Docker Compose services that can be used for adhoc executions of those executables during development.
