#! /bin/bash

# change to 400 key
chmod 400 ./ansibleKey

# on ubyntu ssh-agent not start on default
eval "$(ssh-agent)"

# add to ssh-agent
ssh-add ./ansibleKey

# install ansible
sudo apt update
sudo apt install ansible -y


# run ansible
ansible-playbook -i inventory.yml nginx.yml
