#thanks @SamErde

# If you're looking to specifically reset your block list each time, you could:
(Get-DnsServerQueryResolutionPolicy).Where({ $_.Name -like "block - *" }) | Remove-DnsServerQueryResolutionPolicy -Force

$badtld = Get-Content -Path .\malic-dns-tld.txt | Sort-Object -Unique

foreach ($tld in $badtld) {

 $blockname = "block - " + $tld  
 #$domainname = "." + $tld
 $domainname = "EQ,*." + $tld

 $domainname
 Add-DnsServerQueryResolutionPolicy -Name $blockname -Action IGNORE -FQDN $domainname

}
