import-module au
$releases = "https://dennisbabkin.com/srr"
$regex   = 'ver=(?<Version>[\d\.]*)">Report Errors and Glitches'

function global:au_GetLatest {
     (Invoke-WebRequest -Uri $releases) -match $regex
     return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        "tools\chocolateyuninstall.ps1" = @{          
            "(^(\s)*SRR_Version\s*=\s*)('.*')" = "`$1$($Latest.Version)"
        }        
    }
}

update