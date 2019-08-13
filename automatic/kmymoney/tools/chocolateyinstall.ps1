$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName  
  url            = 'https://download.kde.org/stable/kmymoney/4.8.3/win32/kmymoney-i686-w64-mingw32-4.8.3-3.1-setup.exe'
  url64.         = 'https://download.kde.org/stable/kmymoney/4.8.3/win64/kmymoney-x86_64-w64-mingw32-4.8.3-3.7-setup.exe'  

  checksum       = '53B2C952B30967D0210673C505E115BF14D655F35EE9B7B7AADEB98352FF7A68'
  checksumType   = 'sha256'
  checksum64     = '0C294A4DB2D2274FBC58BB1F63FD34EFB9299E177520EC4BFEABED8305B2ED05'
  checksumType64 = 'sha256'
  
  silentArgs.    = '/S'
}

Install-ChocolateyPackage @packageArgs
