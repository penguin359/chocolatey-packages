$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = '7A8C247D64D55D67E9AD1D2BF7916859950D79020E8AC5F3276C2DC26C498AD3'
  checksumType64 = 'sha256'  
  silentArgs	 = "-q"
}

Install-ChocolateyPackage @packageArgs