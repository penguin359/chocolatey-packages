$packageName= 'sd'

$packageArgs = @{
  packageName   = $packageName  
  url           = 'http://www.ei5di.com/sd/sdsetup.exe'
  
  checksum      = '72E2CAEDA83477A3E996F17A23B73B6241662EB7A3EBCA9E9414A3F025427A80'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs