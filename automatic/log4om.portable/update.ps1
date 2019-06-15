import-module au

function global:au_GetLatest {
    $releases = 'http://www.log4om.com/dl/'
    $regex    = 'Log4OM_(?<Version>[\d_]+)_Portable.zip'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | select -First 1 | Out-Null
    $version = $matches.Version -Replace "_", "."
	
	return @{ Version = $version ; URL32 = 'http://www.log4om.com/log4om/release/Log4OM_' + $matches.Version + '_Portable.zip' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update