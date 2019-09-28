import-module au

$releases = 'https://www.kdevelop.org/download'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
     $regex   = 'kdevelop-(?<Version>[\d\.]+)-x64-setup.exe$'
     $url     = $download_page.links | ? href -match $regex
     $version = $matches.Version
     $versionRelease = $version -Replace "\.", ""
 
     return @{ Version = $version ; VersionRelease = $version_release ; URL64 = $url.href }
}

function global:au_SearchReplace {
    @{
		"tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
			"(^(\s)*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
                        "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
			"(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }		
    }
}

update -checksumFor 64
