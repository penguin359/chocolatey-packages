import-module au

function global:au_GetLatest {
    $releases = 'https://www.designer.io/changelog'
    $regex   = '<h3>Version (?<Version>[\d\.\-]+)</h3>'
    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
    $version = $matches.Version -replace '-', '.'
    	 
	 return @{ Version = $version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{            
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update