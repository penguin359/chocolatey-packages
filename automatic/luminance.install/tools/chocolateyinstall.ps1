$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://netcologne.dl.sourceforge.net/project/qtpfsgui/luminance/2.5.1/Luminance-HDR-x64-SETUP-v2.5.1.exe'
  checksum      = 'A94C49111DBEA9ED304F33D21EBDCD195F8DF9284EC331D77BFB8150DB3833CE'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
