import-module au

function global:au_GetLatest {
    $releases = 'https://www.hmailserver.com/download'
    $regex    = '>Download hMailServer (?<Version>[\d\.]+) - Build (?<Build>[\d\.]+)<'

    (Invoke-WebRequest -Uri $releases).Content -match $regex
    $versionFull = $matches.Version + '.' + $matches.Build

    return @{
        Version = $versionFull
        URL32   = 'https://www.hmailserver.com/files/hMailServer-' + $matches.Version + '-B' + $matches.Build + '.exe'
    }
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