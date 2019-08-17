import-module au

function global:au_GetLatest {     
     $releases = 'https://metaproducts.com/products/startup-organizer'
	 $regex    = '<h2>Startup Organizer (?<Version>[\d\.]+)</h2>'

     (Invoke-WebRequest -Uri $releases).RawContent -Match $regex | Out-Null

     return @{ Version = $matches.Version ; URL32 = 'https://metaproducts.com/download/sosetup.exe' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update