$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.0.1000.0.msi'
  checksum      = 'f3037af08f5dbaa07163d98f0a28f961649f17ac41a31c81dd592d1ad7daf516'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack9.0.1000.0x64.msi'
  checksum64    = '99c202b5ffd7b65ad29e410541330d7aecd7f8ad460a604caacf9bb08972f497'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
