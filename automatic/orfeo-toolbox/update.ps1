$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
     $releases = 'https://www.orfeo-toolbox.org/download/'
     $regex32  = 'OTB-([\d\.]+)-Win32.zip'
	 $regex64  = 'OTB-(?<Version>[\d\.]+)-Win64.zip'

	 $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $url32         = $download_page.links | ? href -match $regex32
     $url64         = $download_page.links | ? href -match $regex64

     return @{
        Version = $matches.Version
        URL32   = $url32.href
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update
