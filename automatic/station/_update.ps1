$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'https://github.com/getstation/desktop-app-releases/releases/latest'
    $regex   = 'browserX-Setup-(?<Version>[\d\.]+).exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.version ; URL32 = 'https://github.com' + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
