$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'http://www.gcndevelopment.com/gnuradio/'
	$regex    = 'gnuradio_(?<Version>[\d\.]+)_win64.msi'    

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | Select -Last 1

    return @{ Version = $matches.Version ; URL64 = $releases + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -checksumFor 64