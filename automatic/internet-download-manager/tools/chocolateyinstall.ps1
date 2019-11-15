$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build11.exe?b=1&filename=idman635build11.exe'
  checksum      = 'ebedca6e4ecaa0228939914e6714bbd7a7abd0b635b69c1f52f41c1f3c3e8c15'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
