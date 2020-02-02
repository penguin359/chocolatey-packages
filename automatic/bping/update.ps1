$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'http://gizmoware.net/bping'
    $regex    = 'v(?<Version>[\d\.]+) \('    

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null
	
    return @{
        Version = $matches.Version
        URL32   = 'https://gizmoware.net/bping/bping.zip'        
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"            
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"            
        }
    }
}

update