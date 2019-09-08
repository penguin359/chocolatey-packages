$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2019_09_03_16_20/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'b4bca81379d548fc40f1e9a7e34567e8bcdafb817df71e0eccb3abc5d96c5ca2'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
