$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://acs.pandasoftware.com/Panda/FREEAV/190612/PANDAFREEAV.exe'
  checksum      = '00CEF69FF557BFEE8CED3E7567B744F2D444374872B9C10A5B72AFDAFAC8E25E'
  checksumType  = 'sha256'
}

# Panda Dome Free Antivirus supports Windows 10, Windows 8/8.1, Windows 7, Window Vista and Windows XP (SP3 or later)
# So, Panda Dome Free Antivirus supports only Workstation OS.
if ( (Get-CimInstance -ClassName Win32_OperatingSystem).ProductType -ne 1 ) {
    Write-Warning "Skipping installation because Panda Dome Free Antivirus supports only Windows 10, Windows 8/8.1, Windows 7, Window Vista and Windows XP (SP3 or later)."
    return
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs