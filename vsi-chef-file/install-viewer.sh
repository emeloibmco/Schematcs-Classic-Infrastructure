#!/bin/bash -v
yes | sudo apt-get update
cd ..
wget -nv -P /downloads https://packages.chef.io/files/stable/chef-workstation/0.18.3/ubuntu/18.04/chef-workstation_0.18.3-1_amd64.deb
dpkg -i /downloads/chef-workstation_0.18.3-1_amd64.deb
echo yes | chef generate repo chef-repo
chef generate cookbook chef-repo/cookbooks/cookbooktest
cat <<EOT >> chef-repo/cookbooks/cookbooktest/recipes/default.rb
file "#{ENV['HOME']}/test.txt" do
  content 'This file was created by Chef Infra!'
end
EOT
cd chef-repo
chef-client --local-mode --override-runlist cookbooktest