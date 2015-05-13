#!/bin/bash

python /opt/graphite/bin/carbon-cache.py start
service shinken start
tail -f /etc/hosts

