
# PASS 123
ansible-vault edit secret-123.yml
ansible-vault create secret-123.yml

# --ask-vault-pass ASKS FOR VAULT PASS FOR group_vars/all/secret-123.yml
# ENTER 123
ansible ubuntu -m ping --ask-vault-pass all

ansible webserver -m ping --ask-vault-pass

# RUNNING run.yml PLAYBOOK
# -K ASKS FOR SUDO PASSWORD
ansible-playbook playbooks/run.yml --ask-vault-pass -K


ansible-playbook --list-tasks -v  playbooks/run.yml 

ansible-galaxy role remove geerlingguy.pip
ansible-galaxy role remove geerlingguy.docker