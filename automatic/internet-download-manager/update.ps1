import-module au

function global:au_GetLatest {
    $releases_version = 'http://www.internetdownloadmanager.com'
    $regex            = 'Internet Download Manager v(?<Version>[\d\.]+)\.'
    $releases         = 'http://www.internetdownloadmanager.com/download.html'
    $regex_url        = 'idman(.*?).exe$'

    (Invoke-WebRequest -Uri $releases_version).RawContent -match $regex | Out-Null
    $version    = $matches.Version

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex_url | Select -First 1

    return @{ Version = $version ; URL32 = $url.href }
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