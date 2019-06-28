$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyuninstall.ahk`""
#Start-Process "C:\ProgramData\Battle.net\Agent\Blizzard Uninstaller.exe" -Wait -PassThru -Verb runas -ArgumentList "--lang=enUS --uid=battle.net --displayname=`"Battle.net`""
& 'C:\ProgramData\Battle.net\Agent\Blizzard Uninstaller.exe' --lang=enUS --uid=battle.net --displayname=`"Battle.Net`"
