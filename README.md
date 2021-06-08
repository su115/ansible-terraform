# Prerequirement:
You need ssh key pair, AWS CLI, terraform, /bin/bash

#
# Instalation:
```
git clone https://github.com/su115/ansible-terraform.git
```
You need change provider options in main.tf
and key option in aws_instance
```
terraform init
terraform apply
./init.sh path_to_instanse_private_ssh_key
```
Thats all:)
![resault](./photo.png)

