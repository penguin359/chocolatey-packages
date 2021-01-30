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

If (!(Test-Path -PathType Container "$env:APPDATA\.emacs.d\.cache\auto-save\site")) {
  New-Item -Force -ItemType "directory" -Path "$env:APPDATA\.emacs.d\.cache\auto-save\site" | Out-Null
}

If (!(Test-Path -PathType Container "$env:APPDATA\.emacs.d\.cache\auto-save\dist")) {
  New-Item -ItemType "directory" -Path "$env:APPDATA\.emacs.d\.cache\auto-save\dist" | Out-Null
}

If (!(Test-Path -PathType Container "$env:APPDATA\.emacs.d\elpa")) {
  New-Item -ItemType "directory" -Path "$env:APPDATA\.emacs.d\elpa" | Out-Null
}

If (!(Get-Content "$env:APPDATA\.emacs.d\init.el" | Select-String "package-check-signature nil" )) {
  "  (setq package-check-signature nil)" | Out-File -Append -Encoding ASCII "$env:APPDATA\.emacs.d\init.el"
}