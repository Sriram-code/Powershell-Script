$fip = "192.168.1.103"
$username = "Admin"
$password = ConvertTo-SecureString "TYPE_YOUR_PASS_HERE" -AsPlainText -Force

$cred = New-Object System.Management.Automation.PSCredential($username,$password)


$name = Read-Host "Enter the name of the script file (without path or extension)"

# Combine the script name with the directory and file extension
$script = {Restart-Computer -Force}
Invoke-Command -ComputerName $fip -Credential $cred -ScriptBlock $script 
