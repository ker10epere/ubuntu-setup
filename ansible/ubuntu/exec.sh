
# PASS 123
ansible-vault edit secret-123.yml
ansible-vault create secret-123.yml

# --ask-vault-pass ASKS FOR VAULT PASS FOR group_vars/all/secret-123.yml
# ENTER 123
ansible ubuntu -i inventory -m ping --ask-vault-pass

# RUNNING run.yml PLAYBOOK
# -K ASKS FOR SUDO PASSWORD
ansible-playbook playbooks/run.yml -K --ask-vault-pass

ansible-playbook playbooks/run.yml --ask-vault-pass -K