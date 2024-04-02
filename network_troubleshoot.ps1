# Reset network adapter
Write-Host "Resetting network adapter..."
Get-NetAdapter | Restart-NetAdapter -Confirm:$false

# Clear DNS cache
Write-Host "Clearing DNS cache..."
Clear-DnsClientCache

# Renew DHCP lease
Write-Host "Renewing DHCP lease..."
ipconfig /renew

# Reset TCP/IP stack
Write-Host "Resetting TCP/IP stack..."
netsh int ip reset

Write-Host "Network troubleshooting completed."