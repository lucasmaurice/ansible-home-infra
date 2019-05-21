install_user = pi
inventory = ansible/inventories/inventory

VENV_NAME?=venv
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python3

venv: $(VENV_NAME)/bin/activate
$(VENV_NAME)/bin/activate: requirements.txt
	test -d $(VENV_NAME) || virtualenv -p python3 $(VENV_NAME)
	${PYTHON} -m pip install -U pip
	${PYTHON} -m pip install -r requirements.txt
	touch $(VENV_NAME)/bin/activate

deploy-users-new: venv
	$(VENV_ACTIVATE) && ansible-playbook -i $(inventory) ansible/users.yml --user=$(install_user) -k -K

deploy-users: venv
	$(VENV_ACTIVATE) && ansible-playbook -i $(inventory) ansible/users.yml

deploy-common: venv
	$(VENV_ACTIVATE) && ansible-playbook -i $(inventory) ansible/common.yml

deploy-nodejs: venv
	$(VENV_ACTIVATE) && ansible-playbook -i $(inventory) ansible/nodejs.yml --ask-vault-pass

deploy-db: venv
	$(VENV_ACTIVATE) && ansible-playbook -i $(inventory) ansible/db.yml --ask-vault-pass

ping: venv
	$(VENV_ACTIVATE) && ansible-playbook -i $(inventory) ansible/ping.yml
