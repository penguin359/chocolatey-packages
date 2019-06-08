import-module au

function global:au_GetLatest {
    $github_repository = "moonlight-stream/moonlight-qt"
    $releases          = "https://github.com/" + $github_repository + "/releases/latest"
    $regex32           = 'MoonlightSetup-x86-(?<Version>[\d\.]+).exe'
    
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32         = $download_page.links | ? href -match $regex32 | Select -First 1

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