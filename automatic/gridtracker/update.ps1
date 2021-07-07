$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	#$releases = 'https://tagloomis.com/downloads'
    $releases  = 'https://gridtracker.org/downloads/'
	$regex     = 'GridTracker-Installer.(?<Version>[\d\.]+).exe(\?dl=1)?'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | select -Last 1

    return @{
        Version = $matches.Version
        URL32   = $url.href
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

update -noCheckUrl