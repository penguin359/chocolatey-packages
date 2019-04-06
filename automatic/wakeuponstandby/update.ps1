import-module au
$releases = "https://dennisbabkin.com/wosb/"
$regex   = 'ver=(?<Version>[\d\.]*)">Report Errors and Glitches'

function global:au_GetLatest {
     (Invoke-WebRequest -Uri $releases) -match $regex
     return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update