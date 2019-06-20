$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://infinitekind.com/stabledl/current/Moneydance_windows_amd64.exe'
  checksum64     = '182f9b4a7b458937d77a195eae6bedd77a7c439d77e0a1a36d41bf910dd3e264'
  checksumType64 = 'sha256'  
  silentArgs	 = "-q"
}

Install-ChocolateyPackage @packageArgs
