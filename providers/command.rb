#
#
# we talk to FHEM via telnet now instead of messing up the config file directly:

require 'net/telnet'

action :send do
  send(@new_resource.name)
end

def send (command)
  fhem = Net::Telnet.new('Host' => 'localhost', 'Port' => 7072) #, 'Prompt' => 'fhem> ')
  fhem.cmd(command)
  # TODO: check for success?
  fhem.close
end
