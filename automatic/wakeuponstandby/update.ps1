$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = "https://dennisbabkin.com/wosb/"
    $regex    = 'ver=(?<Version>[\d\.]*)">'

    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    $version = $matches.Version
    $versionNbSegment = ($version.ToCharArray() | Where-Object {$_ -eq '.'} | Measure-Object).Count
    if ($versionNbSegment -eq 3) { $version += "00" }
    
    return @{
        Version = $version
        URL32   = 'https://dennisbabkin.com/php/downloads/WakeupOnStandBy.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update
