import-module au

function global:au_GetLatest {
    $github_repository = "chrismaltby/gb-studio"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex64  = 'GB.Studio-.*64.*-squirrel-(?<Version>[\d\.]+).zip$'

    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $download_page | ? href -match $regex64 | Out-Null

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

update