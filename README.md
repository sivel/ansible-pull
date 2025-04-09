# ansible-pull

The goal here is to showcase how simple it is to create a small script or playbook that can be more easily understood and meet your specific needs.

In most cases, even the examples here are probably overcomplicating things, especially attempting to map hostnames to playbook files.

Be opinionated and explicit about your usecase. There is no need to try and meet generic usecases that you don't have.

## Examples

1. `ansible-pull.sh` - just a simple shell script
1. `ansible-pull1.sh` - a slightly fancier shell script that will map hostnames to playbooks
1. `ansible-pull2.sh` - basically like `ansible-pull1.sh` except it just uses `git` instead of `ansible` to clone to repo
1. `ansible-pull3.py` - A python variant of `ansible-pull1.sh`
1. `ansible-pull4.yml` - An ansible playbook variant of `ansible-pull1.sh`
