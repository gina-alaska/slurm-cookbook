include_recipe "slurm::default"

directory node['slurm']['config']['state_save_location'] do
  recursive true
end
#
# slurm_nfs_server = search(:node, 'tag:slurm-nfs').first
#
# mount node['slurm']['nfs']['mount'] do
#   device "#{slurm_nfs_server['fqdn']}/#{slurm_nfs_server['slurm']['nfs']['export']}"
#   fstype 'nfs'
# end

include_recipe "slurm::controller"

tag 'slurm-controller'
