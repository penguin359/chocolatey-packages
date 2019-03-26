$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'ImprimChèques *'

  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = "$toolsDir\\imprimcheques\\Install_ImprChq.exe"
  
  url           = 'http://lalimacefolle.com/download/imprimcheques.zip'
  checksum      = '933D45BBD7623105BE19804B96D58E5BB674DC2E054D917B5A76CEF7EBAC0774'
  checksumType  = 'sha256'
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

# ImprimCheques needs "Print Spooler" enabled and running to finalize installation
if ((Get-WmiObject -Query "Select StartMode From Win32_Service Where Name='Spooler'").StartMode -eq "Disabled") {
    Set-Service -Name 'Spooler' -StartupType Automatic
}
if ((Get-Service 'Print Spooler').Status -ne "Running") {
    Start-Service -Name 'Print Spooler'
}


Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs