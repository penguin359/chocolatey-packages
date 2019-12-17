$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = "https://dennisbabkin.com/toff"
    $regex    = 'ver=(?<Version>[\d\.]+)">'
    
    (Invoke-WebRequest -Uri $releases) -match $regex
    
    return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
