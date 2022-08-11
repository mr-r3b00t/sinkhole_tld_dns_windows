#thanks @SamErde

 Get-DnsServerQueryResolutionPolicy | Remove-DnsServerQueryResolutionPolicy -Force

$badtld = Get-Content malic-dns-tld.txt

$badtld = $badtld | Sort-Object -Unique

foreach($tld in $badtld){

$blockname = "block - " + $tld  
#$domainname = "." + $tld
$domainname = "EQ,*." + $tld

$domainname
Add-DnsServerQueryResolutionPolicy -Name $blockname.ToString() -Action IGNORE -FQDN $domainname.tostring() 


}
