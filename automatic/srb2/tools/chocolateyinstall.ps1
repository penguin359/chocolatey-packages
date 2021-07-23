$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/STJr/SRB2/releases/download/SRB2_release_2.2.9/SRB2-v229-Installer.exe'
  checksum      = '08C1C62854C7B104F02059CA493497527B8260284512E74E812B8144CBA31177'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
