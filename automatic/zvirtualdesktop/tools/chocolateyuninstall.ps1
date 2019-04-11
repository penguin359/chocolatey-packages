$ErrorActionPreference = 'SilentlyContinue';

# Stop zVirtualDesktop
$process = Get-Process zVirtualDesktop
if ($process) { $process | Stop-Process }

# Remove zVirtualDesktop
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "zVirtualDesktop"
Remove-Item $Env:AppData\zVirtualDesktop -Recurse