import-module au

function global:au_GetLatest {
    $releases     = 'https://www.keyferret.com/get'
    $regexVersion = 'title="Version (?<Version>[\d\.]+)"'
    
    $download_page = Invoke-WebRequest -Uri $releases

    $download_page.RawContent -match $regexVersion | Out-Null

    return @{
        Version = $matches.version
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