$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
     $releases = 'https://earthalerts.manyjourneys.com'
     $regexVersion = 'Latest build:&nbsp;\<span style="color: #B22222; font-weight:bold"\>(?<Version>[\d+.]+)\<'	

	 (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -match $regexVersion | Out-Null

     return @{
        Version = $matches.Version
        URL32 = 'https://earthalerts.manyjourneys.com/files/Setup_EarthAlerts.zip'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update