#!/bin/sh
if test -d uw3-100; then
  echo not downloading again
else
  wget -nd https://storage.googleapis.com/tmbdev-public/uw3-100.tgz
  tar -zxf uw3-100.tgz
fi
export LANG=C.utf-8
export PYTHONIOENCODING=utf-8
/usr/bin/python -c 'import locale; print locale.getdefaultlocale(); print u"\u0411\n"'
/ocropus/ocropy/ocropus-rtrain -o 'model-%03d' uw3-100/*/*.png
