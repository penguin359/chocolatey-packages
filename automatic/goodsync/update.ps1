$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases     = 'https://www.goodsync.com/download?os=windows'
    $regexVersion = 'GoodSync for Windows v (?<Version>[\d\.]+)\<'
    $regexUrl     = 'GoodSync-v[\d\.]+-Setup.msi$'

    (Invoke-WebRequest -Uri $releases).Content -match $regexVersion | Out-Null
	$version = $matches.Version
    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regexUrl

    return @{
        Version = $version
        URL32   = "$url.href"
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
