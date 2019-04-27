$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
    
  file          = "$toolsDir\wings-2.2.4.exe"
  checksum      = '37823E0D92BF9D66B18015B6A03D368387856A83787FD336A7B808425675D769'
  checksumType  = 'sha256'
  
  file64        = "$toolsDir\wings-x64-2.2.4.exe"
  checksum64    = '425CF26AAACF83866BB71ADE10285DDCE7C39AAD0591423A4295B0154DB2FA1B'
  checksumType64= 'sha256'
  
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs