$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build8.exe?b=1&filename=idman635build8.exe'
  checksum      = '91e29ef253c75be6e08e03e4ea99aef62584e330f550f77836c061076cfa6ae8'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
