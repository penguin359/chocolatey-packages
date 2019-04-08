import-module au
$releases = 'http://www.dxatlas.com/omnirig/'
$regex   = 'Omni-Rig (.*?)<'

function global:au_GetLatest {
     (Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regex
     return @{ Version = $matches[1] }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update