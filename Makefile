ansible_user = ansible
sudo_user = gzsierra
ansible_inventory = my-inventory

deploy-init:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/common.yml --ask-become-pass --ask-pass -u $(sudo_user)

deploy-common:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/common.yml -u $(ansible_user)

deploy-update:
	ansible-playbook -i playbooks/$(ansible_inventory) playbooks/update.yml -u $(ansible_user)
