$badtld = Get-Content C:\dns\blocklist\malic-dns-tld.txt

$badtld = $badtld | Sort-Object -Unique

foreach($tld in $badtld){

#$domainname = "." + $tld
$domainname = $tld

$domainname

Add-DnsServerPrimaryZone -Name $domainname.tostring() -ReplicationScope "Forest" -PassThru

Add-DnsServerResourceRecordA -Name "*" -ZoneName $domainname.tostring() -IPv4Address "192.168.1.1" -TimeToLive 01:00:00

#remove domain zone
#Remove-DnsServerZone -Name $domainname.tostring() -Force

}
