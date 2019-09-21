import-module au

function global:au_GetLatest {
	$releases = 'https://www.realpopup.it/download.html'	
    $regex    = 'Current Version: (?<Version>[\d\.]+) \(';
	
    $download_page = Invoke-WebRequest -Uri $releases
	$download_page.Content -match $regex | Out-Null

    return @{ Version = $matches.version ; URL32 = 'https://www.realpopup.it/files/RealPopupSetup.msi' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update