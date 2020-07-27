# Description: Filter Cisco ASA logs using PowerShell
# Version: 1.004
# Author: WB

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
