# Ansible Template
[![WTFPL](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)](http://www.wtfpl.net)

<a href="http://www.wtfpl.net/"><img
       src=""
       width="80" height="15" alt="" /></a>

This is a base template

### Before
Before trying executing an action, make sure you know the user and password from hosts before doing anything else.

Also! In this repository, there is an inventory of fake hosts (`playbooks/my-inventory`), check it and adapt it your own case!

Command list of action are listed in the `Makefile`

### How to
From main directory, simply use the command `make` to execute an action, ex:
```
make deploy-init
```
or

```
make deploy-common
```

## Licences
[WTFPL](http://www.wtfpl.net)
