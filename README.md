LUGoNS provisioning repo
========================

Packages needed
---------------

* librarian-puppet
* vagrant
* virtualbox

HOWTO
-----

Clone this repo, and enter it's directory. After that, "librarian-puppet install && vagrant up" will download all needed puppet modules and the base image to your HDD, create all VMs and provision them (fancy word for "configure the server"). When up, all VMs will share the directory where this provision repo is, and it's accessable in the VM through /vagrant directory. Have fun.
