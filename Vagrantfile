# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes = {
    'controller'  => [1, 200],
    'compute' => [1, 201],
#   'cinder'  => [1, 202],
}

Vagrant.configure("2") do |config|
    #config.vm.box = "dummy"
    config.vm.box = "precise64"
    #Default is 2200..something, but port 2200 is used by forescout NAC agent.
    config.vm.usable_port_range= 2800..2900 

    nodes.each do |prefix, (count, ip_start)|
        count.times do |i|
            #hostname = "%s-%02d" % [prefix, (i+1)]
            hostname = "%s" % [prefix, (i+1)]
    	    config.vm.provider :rackspace do |rs|
        		rs.username        = "e-vad"
        		rs.api_key         = "c2bb4b9b8893600bc004ff8b966435ed"
        		rs.flavor          = /4GB/
        		rs.image           = /Ubuntu 12.04/
    	    end

            config.vm.define "#{hostname}" do |box|
                box.vm.hostname = "#{hostname}.lab"
                box.vm.network :private_network, ip: "172.16.172.#{ip_start+i}", :netmask => "255.255.255.0"
                box.vm.network :private_network, ip: "10.10.10.#{ip_start+i}", :netmask => "255.255.255.0" 
                box.vm.provision :shell, :path => "#{prefix}.sh"

                # If using Fusion
                box.vm.provider :vmware_fusion do |v|
                    v.vmx["memsize"] = 2048
                    v.vmx["numvcpus"] = 2
            	    if prefix == "cinder"
    	              	v.vmx["memsize"] = 512
                        v.vmx["numvcpus"] = 2
    	            end
                end

                # Otherwise using VirtualBox
                box.vm.provider :virtualbox do |vbox|
	            # Defaults
                    vbox.customize ["modifyvm", :id, "--memory", 2048]
                    vbox.customize ["modifyvm", :id, "--cpus", 2]
        	    if prefix == "cinder"
                    	vbox.customize ["modifyvm", :id, "--memory", 1024]
                        vbox.customize ["modifyvm", :id, "--cpus", 1]
        	    end
                end
            end
        end
    end
end
