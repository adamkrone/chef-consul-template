default['consul_template']['base_url'] = 'https://github.com/hashicorp/consul-template/releases/download/'
default['consul_template']['version'] = '0.5.1'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'
default['consul_template']['checksums'] = {
  'consul-template_0.5.1_darwin_386' => 'e410ac125fecd61e0abed9edbe626e40da526fffe474791af07d89fcc23da98b',
  'consul-template_0.5.1_darwin_amd64' => '32aeb5e50bf00fc46c3ae195a7d43ae539ce13115893b18bb9f2d63e373bed7e',
  'consul-template_0.5.1_dragonfly_386' => 'e28bf7d9fcc22cdfde0c7c8f31e3648a4847e7bda9cb69f309f24257eee3dd41',
  'consul-template_0.5.1_dragonfly_amd64' => 'e28bf7d9fcc22cdfde0c7c8f31e3648a4847e7bda9cb69f309f24257eee3dd41',
  'consul-template_0.5.1_freebsd_386' => '1a2052fdcafe7164ee324540e6c3a46b673543aeb816e315a121cc3effe21f21',
  'consul-template_0.5.1_freebsd_amd64' => 'b105d66f6887ead90a0c19a16b5753b0b7a37b0601db04072beff42952e75c6c',
  'consul-template_0.5.1_freebsd_arm' => '9dd314cb6688f5aa1519d75065cf21fe02de6eca2775f8d62a5ff162e5738089',
  'consul-template_0.5.1_linux_386' => '2e3fe08e98fd6511ae7bb29347f94938f4f7366bb2403dd4dcf5063c9713d7b2',
  'consul-template_0.5.1_linux_amd64' => '059574057cebbc95423b99cad18c5198195506ac1f743c8b0e17f60870ed992a',
  'consul-template_0.5.1_linux_arm' => 'e9f6e2a5c32929d9db48d4fd78b2a3780136e7a25c7c56d70794fc0d759c9f1b',
  'consul-template_0.5.1_netbsd_386' => 'e12a917aa131dd179a761597f243ea53c2cbb98459e58d1d363b8796a63cfd8d',
  'consul-template_0.5.1_netbsd_amd64' => '60d68359f02d5fbdd4b372eb879b571ed60e3fc3eded0cc107d9889b8d542590',
  'consul-template_0.5.1_netbsd_arm' => '496f4bea0ab9b46080b3b7e949b3f6e68d49241f1b121f7ccbb0ff3bbc8c2692',
  'consul-template_0.5.1_openbsd_386' => '5eb7d4d3fdce11348273093a96dea932b509c89152afdd4cd8d8042359762b57',
  'consul-template_0.5.1_openbsd_amd64' => 'fb1755ea093de5c6265a2b5e67bbf9333871557059c677bf5e9682b09e8bd66c',
  'consul-template_0.5.1_plan9_386' => 'e28bf7d9fcc22cdfde0c7c8f31e3648a4847e7bda9cb69f309f24257eee3dd41',
  'consul-template_0.5.1_solaris_amd64' => 'e28bf7d9fcc22cdfde0c7c8f31e3648a4847e7bda9cb69f309f24257eee3dd41',
  'consul-template_0.5.1_windows_386' => 'b4a17e61e6d5ebfa1a358dca1525d36194105d56c8df73f946b4fa56536ee3e3',
  'consul-template_0.5.1_windows_amd64' => 'b3d4631977c153d3398a8265083a3fdc3e7ebdb31e7815e0b3cbcde35b79c7d3',
}
default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['log_level'] = 'info'
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['init_style'] = 'init'   # 'init', 'runit'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'
default['consul_template']['template_mode'] = 0600

# Config attributes
default['consul_template']['config'] = Hash.new
