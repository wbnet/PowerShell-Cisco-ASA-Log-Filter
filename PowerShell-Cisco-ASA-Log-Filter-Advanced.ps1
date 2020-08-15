# Description: Filter Cisco ASA logs using PowerShell (Advanced Version)
# Version: 1.002
# Author: WB

# SolarWinds Kiwi Syslog Server is used to receive
# syslog messages from Cisco ASA firewalls
# and store locally in multiple 50 MB flat-file databases.

# PowerShell script allows efficient extraction of
# useful logs.

# --------------------------------

# Enter your search criteria below.
# Type "any" to ignore filter.

# e.g. $myAddrSrc = "any"
# e.g. $myAddrSrc = "10.10.10.10"

# Any line beginning with # is ignored.

# Then press F5 on keyboard.


# Source IP address
$myAddrSrc = "20.20.20.20"

# Source port number
$myPortSrc = "any"

# Destination IP address
$myAddrDst = "any"

# Destination port number
$myPortDst = "53"

# Which file would you like to search?
# Remember to check date below.
$inputFile = "D:\MyLogFolder\MyFirewall-2020-08-15.txt.001"

# How many lines would you like to search?
$lineQuantity = "500"

# Choose output file
$outputFile = "D:\MyOutputFolder\Output-MyFirewall.txt"








# Stop scrolling now.
# Here be dragons.








$myExtract = Get-Content -tail $lineQuantity $inputFile

$outputBuffer = ""

foreach($line in $myExtract) {
# foreach($line in Get-Content $sampleFile) {

    # write-host($line)
    
    $mySearch = $line -match '(MyFirewall).+\/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\((\d{1,5})\).+\/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\((\d{1,5})\)'
    # $Matches
    $lineMatch = 1

    if(($myAddrSrc -ne "any") -and ($myAddrSrc -ne $Matches[2])){
        $lineMatch = 0
    }

    if(($myPortSrc -ne "any") -and ($myPortSrc -ne $Matches[3])){
        $lineMatch = 0
    }

    if(($myAddrDst -ne "any") -and ($myAddrDst -ne $Matches[4])){
        $lineMatch = 0
    }

    if(($myPortDst -ne "any") -and ($myPortDst -ne $Matches[5])){
        $lineMatch = 0
    }

    if($lineMatch -eq 1){
        # write-host($line)
        $outputBuffer = $outputBuffer + "`r`n" + $line
    }
}

write-host($outputBuffer)

$outputBuffer | Out-File -FilePath $outputFile
