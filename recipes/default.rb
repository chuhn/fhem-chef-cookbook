package 'perl'
package 'perl-modules'
package "liblocal-lib-perl"

include_recipe "cpan"

package "libdevice-serialport-perl"
package "libwww-perl"

remote_file "/tmp/fhem_#{node[:fhem][:version]}.deb" do
  source "http://fhem.de/fhem-5.4.deb"
  mode 0644
  action :create_if_missing
end

dpkg_package "fhem_#{node[:fhem][:version]}.deb" do
  source "/tmp/fhem_#{node[:fhem][:version]}.deb"
  action :install
end

cpan_client 'JSON' do
  action 'install'
  install_type 'cpan_module'
  user 'root'
  group 'root'
end
