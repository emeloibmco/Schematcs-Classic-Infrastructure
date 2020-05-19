#!/bin/bash
yes | sudo apt-get update
cd ..
touch data.txt 
echo 'Esta es una demo provisioner remote-exec' >> data.txt
