import-module au

function global:au_GetLatest {
    $github_repository = 'sedwards2009/extraterm'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'
    $regex   = 'extraterm-setup-(?<Version>[\d\.]*).exe$'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1 | Out-Null

    return @{ Version = $matches.Version + '-pre' }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl