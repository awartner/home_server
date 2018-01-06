name 'home_server'
maintainer 'Aaron M. Wartner'
maintainer_email 'aawartner@gmail.com'
license 'MIT'
description 'Environment cookbook for my home server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.2.1'

issues_url ''
source_url ''

chef_version '>= 13.0' if respond_to?(:chef_version)

supports 'debian', '~> 9.0'

depends 'aw_base', '~> 1.0'
depends 'aw_backuppc', '~> 2.0'
depends 'aw_dnsmasq', '~> 1.0'
depends 'aw_postfix', '~> 1.0'
depends 'aw_samba', '~> 1.0'
