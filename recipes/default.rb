include_recipe "yum-puias"

node['slurm']['packages'].each do |pkg|
  package pkg do
    action [:install]
  end
end


# Create the slurm user based on settings
user(node.slurm['user'])
