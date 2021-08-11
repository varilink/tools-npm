# Tools - NPM

David Williamson @ Varilink Computing Ltd

------

A Docker image that implements the npm package manager. Useful for deploying packages using npm into projects. To build the image:

```bash
docker build --tag varilink/npm .
```

That image name is reflected in Docker Compose services in the projects that use this image. Here is an example of the Docker Compose service within a project that uses this image to install bootstrap into the project from the npm repository:

```yaml
bootstrap:

  image: varilink/npm

  # Version 3.3.6 of the WP Bootstrap Starter theme uses Bootstrap 4.5.3
  command: install bootstrap@4.5.3

  volumes:
    # Create node_modules on host before first run
    - ./node_modules:/node_modules
```
