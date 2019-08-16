$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName  
  url            = 'https://download.kde.org/stable/kmymoney/latest/win32/kmymoney-mingw32-4.8.4-3.2-setup.exe'
  url64          = 'https://download.kde.org/stable/kmymoney/latest/win64/kmymoney-mingw64-4.8.4-2.1-setup.exe'  

  checksum       = '24c3e4291feedf3e4dfae493b72d1563c7136263d0e449ff2f6ed4fdaa854864'
  checksumType   = 'sha256'
  checksum64     = 'caf78eceb7df1d0021698cb39c1302164e144d2afa9adc14fe619746f8db2027'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
