$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file			= (Get-ItemProperty HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\CHIRP UninstallString).UninstallString;
  fileType		= 'exe'
  silentArgs	= '/S'
}

Uninstall-ChocolateyPackage @packageArgs