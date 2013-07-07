name "fhem"
maintainer "nixterrimus"
description "Installs the fhem home automation system"
depends "cpan"

%w{debian ubuntu}.each do |os|
  supports os
end
