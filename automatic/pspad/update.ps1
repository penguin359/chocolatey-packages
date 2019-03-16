import-module au

$releases = 'http://www.pspad.com/en/download.php'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases
	 $regex   = 'pspad(\d+)_setup.exe'
	 $regex_version = 'PSPad - current version (?<Version>[\d\.]+) \('
	 $url = $download_page.links | ? href -match $regex
	 $download_page -match $regex_version
     return @{ Version = $matches.Version ; URL32 = $url.href }
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