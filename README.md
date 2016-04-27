docker-ocropy
=============

> [ocropy](https://github.com/tmbdev/ocropy) in a Docker container.

This is a simple way of getting an ocropy OCR system installed.

## Run it

For convenience, this repo comes bundled with a shell script [run-ocropy](./run-ocropy):

```
> ./run-ocropy --help
./run-ocropy [--help] [--sudo] [--image <image-name>] [--working-dir <working-dir>] <cmd> [args...]

  --sudo                      Run as sudo
  --image <image-name>        Use this image (Default: kbai/ocropy)
  --working-dir <working-dir> Mount this dir (Default: $PWD)
  <cmd>                       Execute this ocropy-<cmd> command
  [args...]                   Depend on the command. See ocropy docs.

Commands:  dewarp econf errs gpageseg gtedit hocr linegen lpred ltrain nlbin rpred rtrain results 
```

## Run with docker command

You can run ocropy from the command line:

    docker run -v `pwd`:/work kbai/ocropy /ocropy/ocropus-rpred *.png

This will:

  * Download the docker-ocropy container from [Docker Hub](https://hub.docker.com/r/kbai/ocropy)
  * Mount <code>`pwd`</code> to the `/work` directory within the docker
  * Execute `/ocropus/ocropy/ocropus-rpred` from within the container
  * On all PNG images in the current dir (`pwd`) on this computer and hence `/work` in the container

See the Docker documentation to see how you need to use the -v flag and other flags.

You can also do training and all the other operations you'd normally run with an ocropy installation.

## Train it

Use the [`ocrotrain.sh`](./ocrotrain.sh) script to see how to train the engine:

    docker run -v "$PWD:/work" kbai/ocropy ./ocrotrain.sh

This will download the [uw3-100 dataset](https://storage.googleapis.com/tmbdev-public/uw5-100.tgz) dataset
and run `ocropus-rtrain` on it.

## Build it

If you want to adapt the Dockerfile and rebuild the image, you can do so with

    docker build [-t '<username>/<reponame>'] .

While optional for local use, choosing a `username/reponame` combo makes it easier to manage
