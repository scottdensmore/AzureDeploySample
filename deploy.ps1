$buildPath = $args[0]
$packagename = $args[1]
$serviceconfig = $args[2]
$servicename = $args[3]
$thumbprint = $args[4]
$cert = Get-Item cert:\CurrentUser\My\$thumbprint
$sub = $args[5]
$slot = $args[6]
$package = join-path $buildPath $packageName
$config = join-path $buildPath $serviceconfig
$a = Get-Date
$buildLabel = $a.ToShortDateString() + "-" + $a.ToShortTimeString()
  
#Important!  When using file based packages (non-http paths), the cmdlets will attempt to upload
#the package to blob storage for you automatically.  If you do not specifiy a -StorageServiceName
#option, it will attempt to upload a storage account with the same name as $servicename.  If that
#account does not exist, it will fail.  This only applies to file-based package paths.

if ((Get-PSSnapin | ?{$_.Name -eq "AzureManagementToolsSnapIn"}) -eq $null)
{
  Add-PSSnapin AzureManagementToolsSnapIn
}

$hostedService = Get-HostedService $servicename -Certificate $cert -SubscriptionId $sub | Get-Deployment -Slot $slot

if ($hostedService.Status -ne $null)
{
    $hostedService |
      Set-DeploymentStatus 'Suspended' |
      Get-OperationStatus -WaitToComplete
    $hostedService | 
      Remove-Deployment | 
      Get-OperationStatus -WaitToComplete
}

Get-HostedService -ServiceName $servicename -Certificate $cert -SubscriptionId $sub |
    New-Deployment -Slot $slot -Package $package -Configuration $config -Label $buildLabel -ServiceName $servicename | 
    Get-OperationStatus -WaitToComplete

Get-HostedService -ServiceName $servicename -Certificate $cert -SubscriptionId $sub | 
    Get-Deployment -Slot $slot | 
    Set-DeploymentStatus 'Running' | 
    Get-OperationStatus -WaitToComplete