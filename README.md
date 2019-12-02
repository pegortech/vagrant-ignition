# Vagrant::Ignition
A Vagrant plugin that generates and mounts gpt partitioned drive for Ignition to use. It is only designed to work with the Virtualbox provider for now. The plugin is forked from vagrant-ignition and enhanced slightly to allow the disk that the plugin creates to be attached to a named contoller. The original version insisted in having a contoller called 'IDE Controller'. If your usual boot device is a SATA controller, then having inserting an IDE disk steals its boot priority and the virtual machine will not boot.\P\P Additionally, the plugin is not fully compatible some of the components that gets shipped with fedora-coreos. Most notable fedora-coreos uses a differnt network manager (NetworkManager as opposed to networkd. Consequently the plugin fails to generate the required network configuratoin. This could be rectified by getting Ignition to add the necessary configuratoin files to /etc/NetworkManager/system-connections."


## Installation
Build the app using:

    $ gem build pegortech-vagrant-ignition.gemspec

And install it with:

    $ vagrant plugin install pegortech-vagrant-ignition-0.0.1.gem

## Usage
To use this plugin, a couple of config options must be set in a project's Vagrantfile config section.

Options:

`config.ignition.enabled`: Set to true to enable this plugin

`config.ignition.path`: Set to the path of the base ignition config (can be nil if there is no base)

`config.ignition.config_obj`: Set equal to `config.vm.provider :virtualbox`

`config.ignition.drive_root`: Set to desired root directory of generated config drive (optional)

`config.ignition.drive_name`: Set to desired filename of generated config drive (optional)

`config.ignition.hostname`: Set to desired hostname of the machine (optional)

`config.ignition.ip`: Set to desired ip of eth1 (only applies if a private network is being created)

`config.ignition.contoller`: Set to the name of the disk controller that the configuration drive is to be attached to. "Defaults to IDE Controller")


## Contributing

Bug reports are welcome at https://issues.coreos.com/.
