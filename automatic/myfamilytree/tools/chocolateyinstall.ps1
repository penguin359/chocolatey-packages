$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.8.1.0.msi'
  checksum      = 'c766347b4718e6d3883f7a283d6aea39ade6783f823eafb96b4c6ce6fd7ec195'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree10.8.1.0x64.msi'
  checksum64    = '63a690b0f499bd4a0fc5100f0daa36c7ede3b0f3432768449f18259e28165dd8'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
