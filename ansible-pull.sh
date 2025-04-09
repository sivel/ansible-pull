#!/bin/bash
# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

REPO="https://github.com/sivel/ansible-pull-test.git"
DEST="/tmp/playbooks"
PLAYBOOK="localhost.yml"
LIMIT="localhost"

ansible localhost -m git -a "repo='$REPO' dest='$DEST'"
cd "$DEST"
ansible-playbook -i inventory --limit "$LIMIT" "$PLAYBOOK"
