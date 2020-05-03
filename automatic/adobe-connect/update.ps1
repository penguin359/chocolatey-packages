$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$release = 'http://www.adobe.com/go/Connectmsi'
	$regex   = 'Connect(?<Version>[\d\._]+).msi'

	$url = Get-RedirectedUrl "$release"
    $url -match $regex | Out-Null
    $version = $matches.Version -Replace '_','.'

    return @{
        Version = $version
        URL32   = $url
    }
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
