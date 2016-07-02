#!/bin/bash
GROUP=plextmp

mkdir -p /config/logs/supervisor

touch /supervisord.log
touch /supervisord.pid
chown plex: /supervisord.log /supervisord.pid

# Get the proper group membership, credit to http://stackoverflow.com/a/28596874/249107

TARGET_GID=$(stat -c "%g" /data)
EXISTS=$(cat /etc/group | grep "${TARGET_GID}" | wc -l)

# Create new group using target GID and add plex user
if [ "$EXISTS" = "0" ]; then
  groupadd --gid "${TARGET_GID}" "${GROUP}"
else
  # GID exists, find group name and add
  GROUP=$(getent group "$TARGET_GID" | cut -d: -f1)
  usermod -a -G "${GROUP}" plex
fi

usermod -a -G "${GROUP}" plex

# Remove previous pid if it exists
rm "${PLEX_PID}"

/usr/sbin/start_pms
