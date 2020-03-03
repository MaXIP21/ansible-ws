#!/usr/bin/env python

# Foreman installer 1.23+ does not work if http_proxy, https_proxy or no_proxy are defined
#
# this is a wrapper which removes these variables from the Foreman installer environment

import os

path = '/usr/sbin/foreman-installer'
args = ['--no-colors']
env = { k: os.getenv(k) for k in os.environ if k not in ['http_proxy', 'https_proxy', 'no_proxy'] }

os.execve(path, args, env)