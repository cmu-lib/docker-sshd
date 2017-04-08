#!/bin/bash

/usr/bin/ssh-keygen -A


addgroup -g ${SSHD_GROUP_ID:=500} ${SSHD_GROUP_NAME:=guest}
adduser -G ${SSHD_GROUP_NAME:=guest} -u  ${SSHD_USER_ID:=500} -h /home/${SSHD_USER_NAME:=guest} -s /bin/bash -D ${SSHD_USER_NAME:=guest}
echo "${SSHD_USER_NAME:=guest}:${SSH_PASSWORD:=$(dd if=/dev/urandom bs=1 count=20 | base64)}" |chpasswd
chown ${SSHD_USER_NAME:=guest}:${SSHD_GROUP_NAME:=guest} /home/${SSHD_USER_NAME:=guest}
chown -R ${SSHD_USER_NAME:=guest} /home/${SSHD_USER_NAME:=guest}/.ssh

exec "$@"
