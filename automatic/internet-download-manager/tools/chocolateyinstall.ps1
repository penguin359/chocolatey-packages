$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build3.exe?b=1&filename=idman635build3.exe'
  checksum      = 'a71eda7bbd7c94db0889abe3000fd0219cd9e949e8637441027bba1dccec499f'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
