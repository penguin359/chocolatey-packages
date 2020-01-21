$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
    $github_repository = "unetbootin/unetbootin"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex   = $github_repository + '/releases/download/.*/unetbootin-windows-(?<Version>.*).exe'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex
	$version = $matches.Version -replace '\w','$&.' -replace '\.$', ''
    
    return @{ Version = $version ; URL32 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none -noCheckUrl
