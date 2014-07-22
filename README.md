docker-ocropus
==============

OCRopus is a Docker container.

This is a simple way of getting an OCRopus OCR system installed.

You can run OCRopus with a command like:

    docker run -v `pwd`:/work tmbdev/ocropus /ocropus/ocropy/ocropus-rpred *.png
    
You can also do training and all the other operations you'd normally run with an OCRopus installation.
See the Docker documentation to see how you need to use the -v flag and other flags.
