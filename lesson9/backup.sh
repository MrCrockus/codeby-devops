#!/bin/bash

mysqldump -u root -proot test1 > /opt/mysql_backups/test_$(date +"%d_%H-%M").sql
