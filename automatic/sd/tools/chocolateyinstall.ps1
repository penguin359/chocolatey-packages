$packageArgs = @{
  packageName   = 'sd'  
  url           = 'http://www.ei5di.com/sd/sdsetup.exe'
  
  checksum      = '45DB0D4FB43CC1ACCB494A3B1B2B7A7CA2F0CF5378BCE9BA84C6434BD732EB0D'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs