#!/bin/bash

/usr/bin/ssh-keygen -A


groupadd -g ${SSHD_GROUP_ID:=500} ${SSHD_GROUP_NAME:=guest}
useradd -g ${SSHD_GROUP_ID:=500} -u  ${SSHD_USER_ID:=500} -d /home/${SSHD_USER_NAME:=guest} ${SSHD_USER_NAME:=guest}
chown ${SSHD_USER_NAME:=guest}:${SSHD_GROUP_NAME:=guest} /home/${SSHD_USER_NAME:=guest}
chown -R ${SSHD_USER_NAME:=guest} /home/${SSHD_USER_NAME:=guest}/.ssh

exec "$@"
