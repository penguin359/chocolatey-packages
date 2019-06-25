import-module au

function global:au_GetLatest {
    $releases = 'https://multipar.eu'
    $regex    = 'MultiPar(?<Version>[\d]+)_setup.exe$'

    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
    $version = $matches.Version -replace "(\d+)(\d)(\d)(\d)", '$1.$2.$3.$4'

    return @{ Version = $version + "00" }
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update