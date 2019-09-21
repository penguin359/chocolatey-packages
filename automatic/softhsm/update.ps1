import-module au

function global:au_GetLatest {
    $github_repository = "disig/SoftHSM2-for-Windows"
    $releases          = "https://github.com/" + $github_repository + "/releases/latest"
    $regex             = 'SoftHSM2-(?<Version>[\d\.]+).msi$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.Version ; URL32 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl