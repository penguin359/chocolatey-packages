import-module au

function global:au_GetLatest {
    $releases = 'https://www.skytopia.com/software/sunsetscreen'
    $regex    = 'SunsetScreen v(?<Version>[\d\.]+)\<'

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