$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path "$env:APPDATA" ".emacs.d"
$backupDate = Get-Date -format "yyyyMMddHHmm"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\spacemacs-0.200.13.zip"
}

Get-ChocolateyUnzip @packageArgs

if (Test-Path "$env:APPDATA\.emacs.d" -PathType Container){
  # Save $env:APPDATA\.emacs.d to $env:APPDATA\.emacs.d.YYYYMMDDHHMM
  Copy-Item "$env:APPDATA\.emacs.d" "$env:APPDATA\.emacs.d.bak.$backupDate"
  Write-Warning "$env:APPDATA\.emacs.d has been saved as $env:APPDATA\.emacs.d.bak.$backupDate"
}

Get-ChildItem -Path "$toolsDir\spacemacs-0.200.13\" -Recurse |  Move-Item -Force -Destination "$env:APPDATA\.emacs.d"