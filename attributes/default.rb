default['consul_template']['base_url'] = 'https://github.com/hashicorp/consul-template/releases/download/'
default['consul_template']['version'] = '0.1.0'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'
default['consul_template']['checksums'] = {
  'consul-template_0.1.0_darwin_386' => '98c520b4ecc3840e797102e8d23227f601b03f818625cef455d0357cf15108e8',
  'consul-template_0.1.0_freebsd_386' => '1e641c4bf0763a1f1fc7cf0c1c02322468438ee326f44d90e00f3d554f8b8e76',
  'consul-template_0.1.0_freebsd_amd64' => '6d1930f8b17ac71dd28f074c5195e1230263e24621fc86e4a29bba39e2a7ff02',
  'consul-template_0.1.0_freebsd_arm' => '924f13f99f63b5f364b34aabfb38bf1e18b71ac56c06a8565cfaaf7c3ae6c8ae',
  'consul-template_0.1.0_linux_386' => '2ed48b6221380977afb93146e88f92333cb9a5e86f00218b13383497b3ff4a17',
  'consul-template_0.1.0_linux_amd64' => 'e56931a7bed383d611842961756101a21f7da796208f4770b148fcdcbe669b76',
  'consul-template_0.1.0_linux_arm' => '101a6ca58ef5c90eb1fab10281aeafdce0322276e1b8a777d00e63f155f47cf4',
  'consul-template_0.1.0_netbsd_386' => '47a580de9e42ff23dc3b03fd4ff2cd85a2dc23d56f3bec4bbe5c14edee67f018',
  'consul-template_0.1.0_netbsd_amd64' => '1a54266a53ec5fa3fde57161bd2b3f2cfc918c3714fa4d4f8f8ec6e280e3890b',
  'consul-template_0.1.0_netbsd_arm' => '63e39dac73d165fd373a3a31e4d5f86dd76b709a17ddeb09b26dda0a66e6aa48',
  'consul-template_0.1.0_openbsd_386' => '21de23e0996a8d034aa8a88472c0a3a3eeadc1c1b510d63df97fec6380a5d0da',
  'consul-template_0.1.0_openbsd_amd64' => '07aa3730c7c853b04455b0f999382dec23aa39beee7ea18c5becc58b91903fbe',
  'consul-template_0.1.0_plan9_386' => '67e30cc266ecd5d981cad2de8d0dd32645b74b38d20cd27ab8af7456ce263d90',
  'consul-template_0.1.0_windows_386' => '643d78fe611a28d852e72306933835eff23e0e7bf274f44c1126cf68ed9b6d76',
  'consul-template_0.1.0_windows_amd64' => '09023b8bcb12d7cbd23b52b457bdd90eea64d13598407791ad0e5e625a00bd66'
}
default['consul_template']['source_revision'] = 'master'


# Service attributes
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['init_style'] = 'init'   # 'init', 'runit'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'


default['consul_template']['templates'] = []
