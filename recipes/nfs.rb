include_recipe "nfs::server"
include_recipe "slurm::common"

directory  node['slurm']['nfs']['export'] do
  owner node['slurm']['user']
  group node['slurm']['user']
  recursive true
end

nfs_export node['slurm']['nfs']['export'] do
  network node['slurm']['nfs']['network']
  anonuser  node['slurm']['user']
  anongroup  node['slurm']['user']
  options ['no_root_squash']
end
