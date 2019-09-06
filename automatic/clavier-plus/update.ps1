import-module au

function global:au_GetLatest {
    $releases = 'http://utilfr42.free.fr/util/Clavier.php'
    $regex    = 'content="Clavier\+ (?<Version>[\d\.]+)"'

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

update