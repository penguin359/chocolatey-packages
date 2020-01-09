$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'http://utvikling.com/JustLearnMorseCode.msi'
  checksum     = 'F770D9EAF988AEFA038E7435B9D95A544135D5D8115F03BF3ACE8B38CD58975B'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs