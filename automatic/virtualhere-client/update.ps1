$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
	$releases = 'https://virtualhere.com/usb_client_software'
	$regex    = '\>Version (?<Version>[\d\.]+)\<'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui32.exe'
        URL64   = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`${1}'$($Latest.URL32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor none
