#!/bin/sh
sudo add-apt-repository ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install python2.6 python2.6-dev python3.4 python3.4-dev fonts-ipafont-gothic libjpeg8-dev libfreetype6-dev

pip install --upgrade pip setuptools wheel
pip install --upgrade --use-wheel detox misspellings check-manifest docutils
find src/ -name "*.py" | misspellings -f -
ALL_TESTS=1 detox
check-manifest
