$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/1/32bit/OpenModelica-v1.16.1-32bit.exe'
  checksum      = '4175b3531a4bb61a0f827217c0dbd8883ecbf4e3dcaf8f554e515eb854905b5a'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.16/1/64bit/OpenModelica-v1.16.1-64bit.exe'
  checksum64    = 'b5b4102167d601574cb2b2ea83b9582fe7d9182771c77b4c8182271254fa70e9'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
