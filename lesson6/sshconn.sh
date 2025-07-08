#!/bin/bash

if [[ "$HOSTNAME" == "server" && ! -e /home/vagrant/.ssh/id_rsa.pub ]]; then
 cat /vagrant/ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
 cp /vagrant/ssh/id_rsa.pub /home/vagrant/.ssh/
#if [ ! -e /home/vagrant/.ssh/id_rsa.pub]; then
 # cp /vagrant/ssh/id_rsa.pub /home/vagrant/.ssh/authorized_keys
fi


if [[ "$HOSTNAME" == "client" && ! -e /home/vagrant/.ssh/id_rsa ]]; then
 cp /vagrant/ssh/id_rsa /home/vagrant/.ssh/
 #if [ ! -e /home/vagrant/.ssh/id_rsa]; then
 # cp /vagrant/ssh/id_rsa /home/vagrant/.ssh/id_rsa
fi


