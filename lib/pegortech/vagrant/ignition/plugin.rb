require "vagrant"

module VagrantPlugins
  module Ignition
    class Plugin < Vagrant.plugin("2")
      name "pegortech-vagrant-ignition"
      description "Ignition support for the virtualbox vagrant provider"

      config "ignition" do
        require_relative "config"
        Config
      end
      
      action_hook(:setup_ignition, :machine_action_up) do |hook|
        require_relative "action/setup_ignition"
        hook.after VagrantPlugins::ProviderVirtualBox::Action::Import, Action::SetupIgnition
      end
    end
  end
end
