node.default['apache']['dir']     = "/var/www/html"
node.default['apache']['version'] = "2.4.18-2ubuntu3.8"

apt_update 'update' do
  action :nothing
end

ohai 'reload' do
  action :nothing
end

package 'apache2' do
  version node['apache']['version']
  action :install
  notifies :update, 'apt_update[update]', :before
  notifies :reload, 'ohai[reload]', :immediately
end

%w{curl htop ntp ruby stress tree vim}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

%w{apache2 ntp}.each do |srv|
  service srv do
    action [:enable, :start]
  end
end

template "#{node['apache']['dir']}/index.html" do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :install, 'package[apache2]', :before
  notifies :reload, 'service[apache2]', :immediately
end
