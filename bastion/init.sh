#!/bin/bash
# Bastion Bot Installation Script
#
# Server Files: /mnt/server
## Move to install folder
apt update
apt install -y build-essential libtool python git tar

mkdir -p /mnt/server/
cd /mnt/server/

if [ -d "/mnt/server/mongodb" ]
then
    cd /mnt/server/
    echo "backing up mongodb"
    REINSTALL=true
    tar -czf mongodb_backup.tar.gz mongodb/
    mv mongodb_backup.tar.gz /tmp
fi

tar -czf mongodb_back.tar.gz mongodb/
mv mongodb_back.tar.gz /tmp

cd /mnt/server
rm -rf * .git/ .github/ .env.example .eslintrc.yml .gitattributes .gitignore .npm/


## Clone repo
echo "cloning Bastion bot"
git clone -q --depth 1 https://github.com/TheBastionBot/Bastion.git ./

echo "npm install --no-package-lock"
npm install --no-package-lock
echo "npm run build"
npm run build

## Move config files.
mv settings.example.yaml settings.yaml
rm bastion.cmd .env.example bastion.sh


mkdir mongodb/
if [ "$REINSTALL" == "true" ]
then
    cd /mnt/server
    echo "reinstall"
    mv /tmp/mongodb_backup.tar.gz /mnt/server
    tar xf mongodb_backup.tar.gz
    rm mongodb_backup.tar.gz
else
    echo "fresh install"
fi

npm run commands # publish commands

echo "-----------------------------------------"
echo "Installation completed..."
echo "-----------------------------------------"
