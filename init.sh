#! /bin/bash

# aws need some time to start ssh-server
sleep 10
##start terraform 
#terraform init
#terraform apply


# get ip address
all_ips=$(terraform output all_ip)
server_0=$(echo $all_ips |cut -d "\"" -f 2)
server_1=$(echo $all_ips |cut -d "\"" -f 4)

# change ip_address on server_1 ip
sed -i "s/ip_address/$server_1/g" ./inventory.yml

# change key
path_to_key=$1
sed -i "s/ansibleKey/$path_to_key/g" ./* #./inventory.yml ./load.sh ./prepairs.sh


# load data on server
./load.sh $server_0 "ubuntu"

### ssh to server
# install ansible add ssh-key and start ansible
ssh -i ansibleKey ubuntu@$server_0 ./prepairs.sh
exit

echo "\n\n\nhttp://$server_1"
