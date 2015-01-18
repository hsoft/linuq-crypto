#!/bin/bash

if [ ! -d "env" ]; then
    echo "No virtualenv. Creating one"
    python3 -m venv env
    if ./env/bin/python -m ensurepip; then
        echo "We're under Python 3.4+, no need to try to install pip!"
    else
        ./env/bin/python get-pip.py
    fi
    ./env/bin/pip install -r requirements.txt
fi

./env/bin/landslide slides.mdown
xdg-open presentation.html

