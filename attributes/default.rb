default['consul_template']['base_url'] = 'https://github.com/hashicorp/consul-template/releases/download/'
default['consul_template']['version'] = '0.3.0'
default['consul_template']['install_method'] = 'binary'
default['consul_template']['install_dir'] = '/usr/local/bin'
default['consul_template']['checksums'] = {
  'consul-template_0.3.0_darwin_386' => 'c64407082df2bcc841a9cd9dc6995aeba5a3d5195366673947d2efa7dd6df4e5',
  'consul-template_0.3.0_darwin_amd64' => '31f40e2a430bf648e7b6eae4dffa6bf84337a45a6608871535e92a7321a17b78',
  'consul-template_0.3.0_dragonfly_386' => '9cdc13567db1df08c8abc0d2b88e9b771324f367c42d97289220968138d0817c',
  'consul-template_0.3.0_dragonfly_amd64' => '81d18d0f1948694dc42957e4acc441b696933c47feb61dc290f732eb75cbae05',
  'consul-template_0.3.0_freebsd_386' => '7e9fb57d2aa7405d1e6d99f814d6a6f917d4d4a1e8be38af9ed334ef641ace5d',
  'consul-template_0.3.0_freebsd_amd64' => '929312c48150bfe0bf2845fe105a8b0cbecfe3f665a2412b18a21571c610bb62',
  'consul-template_0.3.0_freebsd_arm' => 'c93e7a831b518732c79b71cc5127d68ea19110f7d6edef7834ff54a604445c09',
  'consul-template_0.3.0_linux_386' => 'f479ce141478591bb6ee7aa59088ad5b4efa92a0687d130eb1e91d12d29575cd',
  'consul-template_0.3.0_linux_amd64' => '24928d5df5e8ea6f055af6d4b213b259a967a5ebe27635302b7fa19461bc68b9',
  'consul-template_0.3.0_netbsd_386' => '44a5d7a45939c692bf89f152623892476365643a2a4688d8038de05540feca61',
  'consul-template_0.3.0_netbsd_amd64'  => 'f133d3248b44c8b6dc452388dbfe5b87cf2c12e3f922e11fe3f0a0730ad3d412',
  'consul-template_0.3.0_netbsd_arm' => '778bfe38bc9833258a3d2efe20551d7eb6cd7ab7caaca2ea571cb7ac339075d4',
  'consul-template_0.3.0_openbsd_386' => '3b1b673b9a025a7dd60afae733f0ec17dede62e8369f034a6628ba60189e6a82',
  'consul-template_0.3.0_openbsd_amd64' => '6df341ca409c4ff3e9009ffb26581cd02a5f171fc7cbfdf7fee4a75f74421781',
  'consul-template_0.3.0_plan9_386' => '79ae9766c54ffe04b78266ca8666e5bab96ebcf20720e0710b215c00cdf348a9',
  'consul-template_0.3.0_solaris_amd64' => '14e05dc481ef941aa298ee71fee24756fd8840a92c0e3703d75055cf6a593950',
  'consul-template_0.3.0_windows_386' => '7c6bb85b195cedb855665e0f3e6469a6cf7d8ec24e02f8dc4c6f66aa17dd2d5f',
  'consul-template_0.3.0_windows_amd64' => 'fd6e138cee420a8346486436c15583e8262e7d619232aac119bb605b0b898f32'
}
default['consul_template']['source_revision'] = 'master'

# Service attributes
default['consul_template']['config_dir'] = '/etc/consul-template.d'
default['consul_template']['init_style'] = 'init'   # 'init', 'runit'
default['consul_template']['service_user'] = 'consul-template'
default['consul_template']['service_group'] = 'consul-template'


default['consul_template']['templates'] = []
