#!/bin/bash
# Copyright: Contributors to the Ansible project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

REPO="https://github.com/sivel/ansible-pull-test.git"
DEST="/tmp/playbooks"
PLAYBOOK=""

HOSTNAMES=(
    "$(hostname -f)"
    "$(hostname -s)"
    "localhost"
)
LIMIT=$(IFS=, ; echo "${HOSTNAMES[*]}")

if [ ! -d "$DEST" ]; then
    git clone "$REPO" "$DEST"
fi
cd "$DEST"
git pull

if [[ -z "$PLAYBOOK" ]]; then
    for hostname in "${HOSTNAMES[@]}"; do
        file="${hostname}.yml"
        if [[ -f "$file" ]]; then
            PLAYBOOK="$file"
            break
        fi
    done
fi

if [[ -z "$PLAYBOOK" ]]; then
    PLAYBOOK="site.yml"
fi

ansible-playbook -i inventory --limit "$LIMIT" "$PLAYBOOK"
