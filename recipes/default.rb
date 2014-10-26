# -*- coding: utf-8 -*-

# ???
#package "liblocal-lib-perl"

#include_recipe "cpan"

package = "fhem-#{node[:fhem][:version]}.deb"

remote_file "/tmp/#{package}" do
  source "http://fhem.de/#{package}"
  mode 0644
  action :create_if_missing
end

# some magic to auto-install the package dependencies
#  this should be part of the dpkg_package provider …
# TODO: does not work yet: backtick operations are evaluated at compile time, when the package has not
#  been downloaded yet
#`dpkg-deb -I /tmp/#{package}`.match("^ Depends: (.*)")[1].split(/,\s+/).each do |dep| 
  # TODO: we cannot handle the version requirement
  # because the package provider does not support version ranges (ie. minimum versions)
  # TODO #2: handle or'ed dependencies: 'pkg1 | pkg2'
#  package dep.match(/(.*)(?: \((.*)\))/)[1]
#end

%w(perl-base libdevice-serialport-perl libwww-perl).each do |p|
  package p
end

dpkg_package package do
  source "/tmp/#{package}"
  action :install
end

#cpan_client 'JSON' do
#  action 'install'
#  install_type 'cpan_module'
#  user 'root'
#  group 'root'
#end

# let's increase FHEMs lousy default security a bit:
if node[:fhem][:basicAuth]
  require 'base64'
  
  fhem_commamd "attr WEB basicAuth " + Base64.encode64("#{node[:fhem][:basicAuth][:username]}:#{node[:fhem][:basicAuth][:password]}")
end

if node[:fhem][:ssl]
  
  package 'libio-socket-ssl-perl'
  
  if node[:fhem][:ssl][:snakeoil]
    # make use of Debian's pregenerated snakeoil certs

    # this will grant fhem access to the private key:
    group 'ssl-cert' do
      members 'fhem'
      append true
    end

    link '/opt/fhem/certs/server-cert.pem' do
      to '/etc/ssl/certs/ssl-cert-snakeoil.pem'
    end
    link  '/opt/fhem/certs/server-key.pem' do
      to '/etc/ssl/certs/ssl-cert-snakeoil.key'
    end
  else
    # TODO: pull key and cert from a databag?
  end

  fhem_command "attr WEB HTTPS"
end
