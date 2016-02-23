#!bin/bash
sudo service dnsmasq start
#export SECRET_KEY_BASE=$(rake secret)
sudo rails s -b0.0.0.0 -p80
#/etc/hosts - raster.post
