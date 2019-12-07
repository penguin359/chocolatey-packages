$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2019_12_03_16_20/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'fc727ec3bfc3731ca6a6dfd4d705a17df2fdf59ab1b7e4ff65f797e311b0327a'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
