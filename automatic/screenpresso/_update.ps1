$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'https://www.screenpresso.com/download/'
    $regex    = 'Screenpresso (?<Version>(?<VersionMajor>[\d]+)[\d\.]+)\<'	

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page -match $regex | Out-Null
    $version      = $matches.Version
    $versionMajor = $matches.VersionMajor

    return @{
        Version = $version        
        URL32   = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
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