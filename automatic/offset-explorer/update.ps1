import-module au

function global:au_GetLatest {
    $releases = 'http://www.kafkatool.com/download.html'
    $regex    = "Offset Explorer (?<Version>[\d\.]+)<"

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = "https://www.kafkatool.com/download2/offsetexplorer.exe"
        URL64   = "https://www.kafkatool.com/download2/offsetexplorer_64bit.exe"
     }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update