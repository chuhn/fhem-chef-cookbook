#
# Gather weather forecasts from yahoo:
#

woeid = 654200
interval = 3600

fhem_command "define Weather1 Weather #{woeid} #{interval or ''}"
