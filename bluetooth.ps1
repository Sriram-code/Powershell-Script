# Restart Bluetooth service with Force flag
Restart-Service -Name BthServ -Force

# Check if any Bluetooth devices are disabled and attempt to enable them
$disabledDevices = Get-PnpDevice | Where-Object {$_.FriendlyName -like "*Bluetooth*" -and $_.Status -eq "Error"}
if ($disabledDevices) {
    Write-Host "Enabling disabled Bluetooth devices..."
    foreach ($device in $disabledDevices) {
        Enable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
    }
}

# Automatically run Bluetooth troubleshooter
$troubleshooterPath = "$env:SystemRoot\System32\msdt.exe"
$troubleshooterArgs = "-id BluetoothDiagnostic"
Start-Process -FilePath $troubleshooterPath -ArgumentList $troubleshooterArgs -Wait

Write-Host "Bluetooth driver troubleshooting completed."