#!/bin/bash

DIR="/assistant-relay/bin"
if [ "$(ls -A $DIR)" ]; then
echo "config files already exist"
else
cp -R /config/* /assistant-relay/bin/
fi

npm start --prefix /assistant-relay
