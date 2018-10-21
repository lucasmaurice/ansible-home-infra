ansible_user = ansible
ansible_inventory = my-inventory
ansible_password = password

deploy-init:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/common.yml -u $(ansible_user) -p $(ansible_password)

deploy-common:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/common.yml -u $(ansible_user)

deploy-update:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/update.yml -u $(ansible_user)
