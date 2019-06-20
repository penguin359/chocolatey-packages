import-module au

function global:au_GetLatest {  
    $releases = 'https://www.ocenaudio.com'
    $regex    = '\<h1\>ocenaudio (?<Version>[\d\.]+)\</h1\>'

    (Invoke-WebRequest -Uri $releases).RawContent  -match $regex | Out-Null

    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update