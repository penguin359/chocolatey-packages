$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdns.distrib.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2019_07_15_16_20/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'F573FFD378E240DF9F8D680138E4784A55D22148B02D752EEF770EA9140D48EF'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs