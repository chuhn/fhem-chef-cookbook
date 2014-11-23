#
# Gather weather forecasts from yahoo:
#

woeid = 654200
interval = 3600

fhem_command "define Weather_yahoo Weather #{woeid} #{interval or ''}"
fhem_command "define FL_Weather_yahoo FileLog ./log/weather-%Y-%m.log Weather_yahoo"
fhem_command "attr FL_Weather_yahoo logtype text"
