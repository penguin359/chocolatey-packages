import-module au

function global:au_GetLatest {
    $releases = 'https://www.iobit.com/en/advancedsystemcarefree.php'
    $regex    = '<span>V (?<Version>[\d\.]+)</span>'
    
    $download_page = Invoke-WebRequest -Uri $releases
	$url = $download_page.RawContent -match $regex

    return @{
        Version = $matches.Version
        URL32   = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
    }
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