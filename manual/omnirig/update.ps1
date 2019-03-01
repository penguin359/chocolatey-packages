import-module au

$releases = 'http://www.dxatlas.com/omnirig/'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $regex   = 'Omni-Rig (.*?)<'
	 $download_page -match $regex
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