#!/bin/bash
echo How many Ubuntu system you want?
read num
for i in $(seq $num)
do
  
  docker run -d -P --name ubuntu_sys$i ubuntu
  echo -e "\nUbuntu name : ubuntu_sys$i" 
  IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ubuntu_sys$i) 
  echo "Ubuntu IP   $IP: "  
  ssh-keygen -f "/home/vetrivenki/.ssh/known_hosts" -R $IP
done
echo -e "\n"
docker ps