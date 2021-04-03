$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

Start-Process 'regsvr32' -ArgumentList "/s /u $toolsDir\XnShellEx\XnViewShellExt64.dll"