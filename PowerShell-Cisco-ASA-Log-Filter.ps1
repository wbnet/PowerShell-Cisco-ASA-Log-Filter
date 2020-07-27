# Description: Filter Cisco ASA logs using PowerShell
# Version: 1.004
# Author: WB

# SolarWinds Kiwi Syslog Server is used to receive
# syslog messages from Cisco ASA firewalls
# and store locally in multiple 50 MB flat-file databases.

# PowerShell script allows efficient extraction of
# useful logs.

cd "D:\MyLogFolder\"

$myPattern = "10\.20\.30\.40"

# Example patterns
# "10\.20\.30\.40" - IP address
# "10\.20\.30\.40\(80\)" - IP address and port number
# "MyRuleName" - Text search

# Search logs from only one day
Select-String -Path .\*2020-07-27.* -Pattern $myPattern

# Search all logs
# Select-String -Path .\*.* -Pattern $myPattern
