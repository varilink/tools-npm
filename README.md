# Tools - NPM

David Williamson @ Varilink Computing Ltd

------

A Docker image that implements the npm package manager. Useful for deploying packages using npm into projects. To build the image:

```bash
docker build --tag varilink/npm .
```

The resulting image has the npm command as its entrypoint so it can then be used to do things like this example:

```bash
docker run --rm --volume "$PWD/node_modules:/node_modules" varilink/npm install bootstrap@4.5.3
```
