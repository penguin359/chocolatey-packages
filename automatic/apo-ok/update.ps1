import-module au

function global:au_GetLatest {
    $releases = 'https://www.softwareok.com/?seite=Microsoft/AutoPowerOptionsOK'
    $regex    = "<title>AutoPowerOptionsOK (?<Version>[\d\.]+)</title>"

    (Invoke-WebRequest -Uri $releases) -match $regex | out-null
     return @{
        Version = $matches.Version
    }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl