import-module au

function global:au_GetLatest {
    $github_repository = 'pyzo/pyzo'
    $releases   = "https://github.com/" + $github_repository + "/releases/latest"
    $regex      = 'pyzo-(?<Version>[\d\.]+)-win64-windows10.exe$'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1 | Out-Null

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