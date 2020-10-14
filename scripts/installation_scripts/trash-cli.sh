#!/bin/bash
cd
git clone https://github.com/andreafrancia/trash-cli.git
cd trash-cli
sudo apt-get install python3-setuptools -y
sudo python3 setup.py install
