import-module au

function global:au_GetLatest {
    $releases = 'http://www.kafkatool.com/download.html'
    $regex    = "Kafka Tool (?<Version>[\d\.]+)<"

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = "http://www.kafkatool.com/download2/kafkatool.exe"
        URL64   = "http://www.kafkatool.com/download2/kafkatool_64bit.exe"
     }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update