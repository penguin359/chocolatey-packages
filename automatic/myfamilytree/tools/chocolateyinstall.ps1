$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.3.0.msi'
  checksum      = '743917b3591c75bf8a1568e5f1a833e5c2a574abce4c96ac02eed2726c648349'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.3.3.0x64.msi'
  checksum64    = '612b165c0d1bbc995fd8e4ee4f836f7107e0c65b2646e632574142f0f58b2fc1'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
