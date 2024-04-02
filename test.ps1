$fip = "192.168.50.4"
$username = "Sriram"
$password = ConvertTo-SecureString "1234" -AsPlainText -Force

$cred = New-Object System.Management.Automation.PSCredential($username,$password)


$name = Read-Host "Enter the name of the script file (without path or extension)"

# Combine the script name with the directory and file extension
$script = "D:\$name.ps1"

Invoke-Command -ComputerName $fip -FilePath $script -Credential $cred
