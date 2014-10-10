default['slurm']['packages'] = %w{
  munge
  slurm
  slurm-devel
  slurm-munge
  slurm-perlapi
  slurm-plugins
  slurm-sjobexit
  slurm-sjstat
  slurm-torque
}
default['slurm']['user'] = 'slurm'
default['slurm']['cpus'] = "1"
default['slurm']['partition'] = 'production'
# MUNGE attributes
default['munge']['key'] = "RandomKeyGoesHereRandomKeyGoesHereRandomKeyGoesHereRandomKeyGoesHere"

# Slurm config is CamelCaseKey=value.
# Attribute keys are snake_cased, and will be converted to CamelCase
default['slurm']['config'] = {
  auth_type: 'auth/munge',
  cache_groups: '0',
  crypto_type: 'crypto/munge',
  fast_schedule: '1',
  job_comp_loc: '/var/log/slurm.job.log',
  job_comp_type: 'jobcomp/filetxt',
  plugin_dir: '/usr/lib64/slurm',
  scheduler_type: 'sched/backfill',
  select_type: 'select/linear',
  slurmctld_pid_file: '/var/run/slurmctld.pid',
  slurmctld_port: '6817',
  slurmctld_timeout: '300',
  slurmd_pid_file: '/var/run/slurmd.pid',
  slurmd_port: '6818',
  slurmd_spool_dir: '/var/spool/slurmd.spool',
  slurmd_timeout: '300',
  state_save_location: '/var/slurm/slurm.state',
  switch_type: 'switch/none',
}

default['slurm']['nfs']['export'] = "/tmp/slurm"
default['slurm']['nfs']['network'] = '0.0.0.0/0'
default['slurm']['nfs']['mount']
