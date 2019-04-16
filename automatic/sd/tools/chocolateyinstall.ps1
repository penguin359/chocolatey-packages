$packageArgs = @{
  packageName   = 'sd'  
  url           = 'http://www.ei5di.com/sd/sdsetup.exe'
  
  checksum      = 'ec999737f50b4eaec71e02d1e46bcc1e50f5bfe89cd35e2764735d78fdce5303'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
