$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'e593ad83b90bcdb1816f2f8d27b0ebb5207ed2dc79c6724e4fe729c968468c73'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '915c09dc6c1c53ab1611f0a2ef73962f015c0f30de87a0066b96c6105ee63a0a'
  checksumType64 = 'sha256'

  silentArgs	 = "/S"
}

Install-ChocolateyPackage @packageArgs
