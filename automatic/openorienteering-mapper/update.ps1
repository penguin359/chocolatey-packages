import-module au

function global:au_GetLatest {
    $github_repository = "OpenOrienteering/mapper"
    $releases          = "https://github.com/" + $github_repository + "/releases/latest"
    $regex32           = 'OpenOrienteering-Mapper-([\d\.]+)-Windows-x86.exe'
    $regex64           = 'OpenOrienteering-Mapper-(?<Version>[\d\.]+)-Windows-x64.exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64

    return @{
        Version = $matches.Version
        URL32 = "https://github.com" + $url32.href
        URL64 = "https://github.com" + $url64.href
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