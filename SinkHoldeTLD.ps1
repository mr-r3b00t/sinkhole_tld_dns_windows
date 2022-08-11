$badtld = Get-Content malic-dns-tld.txt

$badtld = $badtld | Sort-Object -Unique

foreach($tld in $badtld){

#$domainname = "." + $tld
$domainname = $tld

$domainname

Add-DnsServerPrimaryZone -Name $domainname.tostring() -ReplicationScope "Forest" -PassThru

Add-DnsServerResourceRecordA -Name "*" -ZoneName $domainname.tostring() -IPv4Address "127.0.0.1" -TimeToLive 01:00:00

#remove domain zone
#Remove-DnsServerZone -Name $domainname.tostring() -Force

}
