$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2019_10_15_16_20/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = '9670c184b32940c280e4df30e55f4c62cf57a0ca969491e9f2751efc13bcd89b'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
