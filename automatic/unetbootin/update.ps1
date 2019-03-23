import-module au
$github_repository = "unetbootin/unetbootin"
$releases = "https://github.com/" + $github_repository + "/releases/latest"

function global:au_GetLatest {	
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 https://github.com/unetbootin/unetbootin/releases/download/661/unetbootin-windows-661.exe
	 $regex   = $github_repository + '/releases/download/.*/unetbootin-windows-(?<Version>.*).exe'
	 $version = $matches.Version -replace '\w','$&.' -replace '\.$', ''
	 $url = $download_page.links | ? href -match $regex	 
     return @{ Version = $version ; URL32 = "https://github.com" + $url.href }
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