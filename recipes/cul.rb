#
# setup specific to CUL 
#

package 'dfu-programmer' # for firmware flashing

version = "1.61"
archive = "culfw-#{version}.tar.gz"

remote_file "http://culfw.de/#{archive}" do
  directory "/tmp"
end

execute "tar xvfz #{archive}" do
  cwd "/tmp"
end

# TODO: This only makes sense if the CUL is plugged in in the proper mode
execute "make ubsprogram_v3" do
  cwd "/tmp/CUL_VER_#{version.gsub('.','')}/Devices/CUL"
  action :nothing
end
