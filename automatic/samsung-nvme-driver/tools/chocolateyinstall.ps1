$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://s3.ap-northeast-2.amazonaws.com/global.semi.static/SamsungNVMExpressDriver3.3/7322A6707A720E1A71EF11A3BE1EED819E011D317626415F0281A78151C/Samsung_NVM_Express_Driver_3.3.exe'
  checksum      = 'D78C83C8D90CF666675E6E9D148BB3694F414B50458793F6DADDB85E5BF13B6B'
  checksumType  = 'sha256'

  silentArgs    = '/q'
}

Install-ChocolateyPackage @packageArgs
