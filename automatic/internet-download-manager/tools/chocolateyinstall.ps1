$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build5.exe?b=1&filename=idman635build5.exe'
  checksum      = 'c3d167ceb717101d9a1c83b117ba64a1c25af50e108c766084d8581f1f65fda7'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
