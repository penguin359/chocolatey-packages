$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'msi'
    
  url           = 'https://voipcallrecording.com/MP3SkypeRecorderSetup.msi'
  checksum      = '98407E99F736642A1F4B9E1F3D9665448630D0E6398925374EFD601B5DCD8D4C'
  checksumType  = 'sha256'  
  
  silentArgs	= "/qn /norestart /l*v $env:Temp\$env:ChocolateyPackageName.MsiInstall.log"
}

Install-ChocolateyPackage @packageArgs
