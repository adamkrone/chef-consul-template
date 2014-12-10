default['consul_template']['base_url'] = 'https://github.com/hashicorp/consul-template/releases/download/'
default['consul_template']['version'] = '0.3.1'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'
default['consul_template']['checksums'] = {
  'consul-template_0.3.1_darwin_386' => 'f875824e54b2663823381e0478519698417998000bc840ed658a1330fcf95038',
  'consul-template_0.3.1_darwin_amd64' => '785d7bd07a52fe30e5339ff6bf1a761f5dcd032b94144d30b8c7562a477405ba',
  'consul-template_0.3.1_dragonfly_386' => 'e099af33a52e298c5993081ae28674be30a58935ce1d3a253a0f953289fb3958',
  'consul-template_0.3.1_dragonfly_amd64' => '918b2cf584b8a479de2b39fd42b7fb054b7efb315936260a1c59fa9e3da30c34',
  'consul-template_0.3.1_freebsd_386' => 'eb4a6f3aaf5cd3075d6c2fbff03127158aa0d72b487fcd72e5fe383b2e6e41ad',
  'consul-template_0.3.1_freebsd_amd64' => '92107e74c3e3f2d6e71e2881e8f580b94f010375e85771cc31cb7e797f2c6827',
  'consul-template_0.3.1_freebsd_arm' => '2b31190ade61c3ea7245821f3ca50161a6aed08d0025c15fdca095c6663a7cad',
  'consul-template_0.3.1_linux_386' => '3d0773e0e1e82dd2bb725c5c366102585bc821c0104879321c1e6e743dafdd68',
  'consul-template_0.3.1_linux_amd64' => 'a6cd9ac0880fc3a380b6fe50491797c38b87ec79803d5654d16c40853c6ccbf2',
  'consul-template_0.3.1_linux_arm' => 'da2f2f0441d08dce24594a2e9914a45fc6bfdb10a98a0710ce1331527788d5ad',
  'consul-template_0.3.1_netbsd_386' => '37f8001ba780042f7430db58d15b9133553668fbe3dadfa053363cff9d68429c',
  'consul-template_0.3.1_netbsd_amd64' => 'b8717c24450b14415d9d03acc9da48454f6be16ceaf5869dfcc23d04589c3889',
  'consul-template_0.3.1_netbsd_arm' => '64b20dc388e04b71f78a4fb09fc762e138c2a41d6e372e74aebd6637b1c18669',
  'consul-template_0.3.1_openbsd_386' => '1f42fd6d4d08992839cb3f08c632a15c371294b3abb15c3e8e57e1a40db0417d',
  'consul-template_0.3.1_openbsd_amd64' => 'a0e288bb26951a62138aef346798a8b5b1907a029da9fae07e7619ccf6bf96ce',
  'consul-template_0.3.1_plan9_386' => '67a321667e782001177aaf2f363f96abb268109c14d29c14968ceaf22e81c395',
  'consul-template_0.3.1_solaris_amd64' => '36b4cf924e2de65385964f5b97934977acd355e27574506ba53597f3492be72d',
  'consul-template_0.3.1_windows_386' => 'ae72874c5afb79c7ebb3885f6672884563552c9000e7d7dedb72530ff23d5045',
  'consul-template_0.3.1_windows_amd64' => '7a21e55b89a71e72baec90b17b74403e37197358845445f2fdbc40179a440ae2',
}
default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['init_style'] = 'init'   # 'init', 'runit'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'
default['consul_template']['template_mode'] = 0600

# Config attributes
default['consul_template']['config'] = Hash.new
