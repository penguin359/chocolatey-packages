import-module au

function global:au_GetLatest {
    $github_repository = "asciidocfx/AsciidocFX"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = '/asciidocfx/AsciidocFX/tree/v(?<Version>[\d\.]*)\"'

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null    

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