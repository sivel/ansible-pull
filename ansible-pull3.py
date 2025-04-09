#!/usr/bin/env python
# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

import os
import platform
import subprocess

REPO = "https://github.com/sivel/ansible-pull-test.git"
DEST = "/tmp/playbooks"
PLAYBOOK = ""

_HOSTNAME = platform.node()
HOSTNAMES = [
    _HOSTNAME,
    _HOSTNAME.split('.')[0],
    'localhost'
]
LIMIT = ','.join(HOSTNAMES)

subprocess.run(
    ['ansible', 'localhost', '-m', 'git', '-a', f'repo="{REPO}" dest="{DEST}"']
)
os.chdir(DEST)

if not PLAYBOOK:
    for hostname in HOSTNAMES:
        if os.path.isfile(f'{hostname}.yml'):
            PLAYBOOK = f'{hostname}.yml'
            break

if not PLAYBOOK:
    PLAYBOOK = 'site.yml'

subprocess.run(
    ['ansible-playbook', '-i', 'inventory', '--limit', LIMIT, PLAYBOOK]
)
