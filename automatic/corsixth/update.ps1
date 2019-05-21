import-module au

function global:au_GetLatest {
    $github_repository = "CorsixTH/CorsixTH"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex = '<title>Release CorsixTH (?<Version>[\d\.]+) · '

    $download_page = (Invoke-WebRequest -Uri $releases).RawContent -match $regex
    $version = $matches.Version

    return @{
        Version = $version
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