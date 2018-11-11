ansible_user = ansible
sudo_user = debian
ansible_inventory = my-inventory

deploy-init:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/init.yml --ask-become-pass --ask-pass -u $(sudo_user)

deploy-common:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/common.yml  --ask-vault-pass -u $(ansible_user)

deploy-update:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/update.yml -u $(ansible_user)

ping:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/ping.yml -u $(ansible_user)
