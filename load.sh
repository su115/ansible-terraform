#! /bin/bash
#Only load fails on server


#ip address get as param
ip=$1
username=$2


# ansibleKey is ssh private key!!!
scp ./ansibleKey $username@$ip:/home/$username

# for ansible
scp  ./nginx.yml  $username@$ip:/home/$username
scp  ./inventory.yml  $username@$ip:/home/$username
scp  ./prepairs.sh $username@$ip:/home/$username
scp  ./ansible.cfg $username@$ip:/home/$username
