#!/bin/bash

source activate pixelenv  &&
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" &&
cd $DIR &&
python manage.py runserver_plus --cert cert.crt
