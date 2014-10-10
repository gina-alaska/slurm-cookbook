# Munge is used by SLURM for authentication, and requires a few
# pre-conditions.

# Make sure /etc/munge directory exists
directory "/etc/munge" do
  action :create
end

# Make sure the munge user exists
user("munge")

# Create the munge key from template
template "/etc/munge/munge.key" do
  source "munge.key.erb"
  owner "munge"
  variables( {key: node['munge']['key']} )
  mode 0600
end

# Enable and start the munge service
service "munge" do
  action [:enable,:start]
end
