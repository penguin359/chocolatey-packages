$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.qutim.org/dwnl/66/qutIM_0.3.2-1_setup.exe'
  checksum      = '3D6A26F96E770928BC548012FC6A5FBE76A27CB8BEA50336D52EB678DA3F0569'
  checksumType  = 'sha256'
  
  silentArgs	= "/S _?=`"$Env:ProgramFiles(x86)\$packageName`""
}

Install-ChocolateyPackage @packageArgs