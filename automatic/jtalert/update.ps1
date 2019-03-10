import-module au

$releases = 'https://hamapps.com/'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 
	 $regex_win10 = 'HamApps_JTAlert_AL_(.*?)_Setup.exe">Download'
	 $url_win10 = $download_page.links | ? outerHTML -match $regex_win10 | select -Last 1
	 $url_win10 -split '-|_Setup.exe' | select -First 1
	 $version_win10 = $matches[1];
	 
	 $regex = 'HamApps_JTAlert_(.*?)_Setup.exe">Download'
	 $url = $download_page.links | ? outerHTML -match $regex | select -First 1
	 $url -split '-|_Setup.exe' | select -First 1
	 $version = $matches[1];
	 
     return @{ Version = $version ; URL32 = $url.href ; Version_win10 = $version_win10 ; URL32_win10 = $url_win10.href}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*\$url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*\$checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^(\s)*\$url\s*=\s*)('.*_AL_.*')" = "`$1'$($Latest.URL32_win10)'"
            "(^(\s)*\$checksum\s*=\s*)('.*_AL_.*')" = "`$1'$($Latest.Checksum32_win10)'"			
        }
    }
}

update