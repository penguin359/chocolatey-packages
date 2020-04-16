$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20200415141811.win32.installer.exe'
  checksum       = 'c0ade35c03209531f0bfca433aa257e1a89231923b9c190828b8bb798d868f20'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20200415150025.win64.installer.exe'
  checksum64     = 'fbce0f6412a1de6b164652bf22d77449939357e964a5e9707431a0717d28742e'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
