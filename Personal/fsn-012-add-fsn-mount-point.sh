#!/bin/bash

echo "Amending /etc/fstab"

if sed -n '/fn-docs/p' /etc/fstab | grep -q .; then
  echo "fn-doc found in /etc/fstab"
else
echo '//192.168.1.23/fn-docs /mnt/fn-docs cifs uid=nicholas,gid=nicholas,username=nicholas,password=5911sally,x-systemd.automount,vers=3.0 0 0' | sudo tee --append /etc/fstab  
fi