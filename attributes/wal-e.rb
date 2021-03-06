default['postgresql']['wal_e'] = {
  enabled: false,
  packages: %w(
    python-setuptools
    python-dev
    lzop
    pv
    git
    libevent-dev
    daemontools
  ),
  pips: %w(
    gevent
    argparse
    boto
  ),
  git_version: 'v0.7.3',
  env_dir: '/etc/wal-e',
  aws_access_key: nil,
  aws_secret_key: nil,
  s3_bucket: nil,
  base_backup: {
    minute: '0',
    hour: '0',
    day: '*',
    month: '*',
    weekday: '1',
    log_path: '/var/log/wal-e',
    flock_cmd: 'flock -x -n /tmp/wal-e_base_backup.lck',
    timeout_cmd: 'timeout --preserve-status -k 5 2h'
  },
  user: 'postgres',
  group: 'postgres',
}
