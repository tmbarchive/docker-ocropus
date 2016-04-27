docker-ocropy
=============

> [ocropy](https://github.com/tmbdev/ocropy) in a Docker container.

This is a simple way of getting an ocropy OCR system installed.

## Run it

You can run ocropy from the command line:

    docker run -v `pwd`:/work kbai/ocropy /ocropus/ocropy/ocropus-rpred *.png

This will:

  * Download the docker-ocropy container from [Docker Hub](https://hub.docker.com/r/kbai/ocropy)
  * Mount <code>`pwd`</code> to the `/work` directory within the docker
  * Execute `/ocropus/ocropy/ocropus-rpred` from within the container
  * On all PNG images in the current dir (`pwd`) on this computer and hence `/work` in the container

See the Docker documentation to see how you need to use the -v flag and other flags.

You can also do training and all the other operations you'd normally run with an ocropy installation.

## Build it

If you want to adapt the Dockerfile and rebuild the image, you can do so with

    docker build [-t '<username>/<reponame>'] .

While optional for local use, choosing a `username/reponame` combo makes it easier to manage
