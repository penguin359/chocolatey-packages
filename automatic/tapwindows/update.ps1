import-module au
$releases = 'https://community.openvpn.net/openvpn/wiki/GettingTapWindows'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases
	 $regex   = '>tap-windows-(?<Version>[\d\.]*)  </td><td style="text-align: left">tap-windows6'
	 $url = $download_page -match $regex
     $version = $matches.Version     
     return @{ Version = $version ; URL32 = 'https://build.openvpn.net/downloads/releases/tap-windows-' + $version + '.exe' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update