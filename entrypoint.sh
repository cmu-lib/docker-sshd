#!/bin/bash

/usr/bin/ssh-keygen -A

exec "$@"
