LUGoNS provisioning repo
========================

Packages needed
---------------

* ansible
* vagrant
* virtualbox

HOWTO
-----

Clone this repo, and enter it's directory. After that, "vagrant up" will the base image to your HDD, create all VMs and provision them (fancy word for "configure the server"). When up, all VMs will share the directory where this provision repo is, and it's accessable from the VM through /vagrant directory. Have fun!
