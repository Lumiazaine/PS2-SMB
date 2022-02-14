#Requires -RunAsAdministrator
#Enable SMB 1.0

Start-Process -FilePath powershell.exe -ArgumentList {
    Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Out-Host
} -verb RunAs

#Create dir

@('APPS', 'ART', 'CD', 'CFG', 'CHT', 'DVD', 'LNG', 'POPS', 'THM', 'VMC') |
    ForEach-Object {
        New-Item (Join-Path './ps2smb' $_) -ItemType Directory -force
    }

$everyoneSID = [System.Security.Principal.SecurityIdentifier]::new('S-1-1-0')
$everyoneName = $everyoneSID.Translate([System.Security.Principal.NTAccount]).Value

Get-ChildItem .\ -Directory |ForEach-Object {
    New-SmbShare -Name $_.Name -Path $_.FullName -FullAccess $everyoneName
    }


