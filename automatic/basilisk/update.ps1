import-module au

function global:au_GetLatest {
    $releases = 'https://github.com/MoonchildProductions/UXP/releases'
    $regex    = '>Basilisk (?<Version>[\d\.]*)<'
    
    (Invoke-WebRequest -Uri $releases).RawContent -match $regex |`Out-Null

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