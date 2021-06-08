#! /bin/bash

#ip address get as param
ip=$1
username=$2

scp ./ansibleKey $username@$ip:/home/$username
scp ./nginx.yml  $username@$ip:/home/$username
scp ./inventory.yml  $username@$ip:/home/$username
