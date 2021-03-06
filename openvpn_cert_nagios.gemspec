$:.push File.expand_path("../lib", __FILE__)

require "openvpn_cert_nagios/version"
spec = Gem::Specification.new do |s|
  s.name = 'openvpn_cert_nagios'
  s.version = CertCheck::VERSION
  s.license = 'MIT'
  s.author = 'Dmytro Kovalov'
  s.email = 'dmytro.kovalov@gmail.com'
  s.homepage = 'http://dmytro.github.com/'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Check expiration date of the OpenVPN certs'
  s.description =<<-EOF

For every certificate in EasyRSA directory check expiration date and issue warning or critial warning alert.

EOF

  s.required_ruby_version = '>= 2.0.0'

  s.files = ( %w{ bin/check_open_vpn_cert } +
              Dir.glob("{bin,lib,spec,config,test}/**/*")
             ).uniq

  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'check_open_vpn_cert'
  s.default_executable = 'check_open_vpn_cert'
  # GEMS

  s.add_dependency 'nagios_check', '~> 0.0'

  # Dev
  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency 'yard', "~> 0.8"
end
