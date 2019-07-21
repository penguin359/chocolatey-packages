import-module au

function global:au_GetLatest {
    $releases = 'https://www.buffalotech.com/support'

    $regex    = 'nasnavi-(?<VersionMajor>\d)(?<VersionMinor>\d\d).zip$'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.VersionMajor + '.' + $matches.VersionMinor ; URL32 = $url.href }
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