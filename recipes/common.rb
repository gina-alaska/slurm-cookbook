
include_recipe 'slurm::munge'
# SLURM configuration

# Make sure the config directory exists
directory "/etc/slurm" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

slurm_compute_nodes = search(:node,"tags:slurm-compute")
master_node = search(:node, 'tags:slurm-controller').first
master_node = node
# Build slurm.conf based on the template
template "/etc/slurm/slurm.conf" do
  source "slurm.conf.erb"
  owner "slurm"
  mode "0644"
  variables({
    compute_nodes: slurm_compute_nodes,
    master_name: master_node['hostname'],
    master_addr: master_node['ipaddress'],
    user: node['slurm']['user'],
    nfs_partition: node['slurm']['nfs_partition'],
    cpus: node['slurm']['cpus'],
    params: node['slurm']['config'],
    partition: node['slurm']['partition']
  })
end

# Enable and start the slurm service
service "slurm" do
  action [:enable,:start]
end
