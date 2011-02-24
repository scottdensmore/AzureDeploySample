$servicename = $args[0]
$certToDeploy = $args[1]
$certPassword = $args[2]
$thumbprint = $args[3]
$cert = Get-Item cert:\CurrentUser\My\$thumbprint
$sub = $args[4]
$algo = $args[5]
$certThumb = $args[6]


if ((Get-PSSnapin | ?{$_.Name -eq "AzureManagementToolsSnapIn"}) -eq $null)
{
  Add-PSSnapin AzureManagementToolsSnapIn
}


try
{
  Remove-Certificate -ServiceName $servicename -ThumbprintAlgorithm $algo -Thumbprint $certThumb -Certificate $cert -SubscriptionId $sub
}
catch {}

Add-Certificate -ServiceName $servicename -Certificate $cert -SubscriptionId $sub -CertificateToDeploy $certToDeploy -Password $certPassword
