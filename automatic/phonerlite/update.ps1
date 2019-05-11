import-module au

function global:au_GetLatest {
    $releases = 'http://phonerlite.de/download_en.htm'
    $regex    = '<td>(?<Version>[\d\.]+)</td>'

    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl