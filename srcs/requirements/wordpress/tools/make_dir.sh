#!/bin/bash

if [ ! -d "/home/${USER}/data" ];
then
	mkdir ~/data
	mkdir ~/data/mariadb_vol
	mkdir ~/data/wordpress_vol
fi