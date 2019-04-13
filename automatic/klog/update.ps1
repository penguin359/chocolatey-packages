import-module au
$releases = 'https://download.savannah.gnu.org/releases/klog/win/'
$regex   = 'KLog-(.*)-windows-installer.exe$'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $url = $download_page.links | ? href -match $regex | select -Last 1
	 $version = $url -split '-|.exe' | select -Last 1 -Skip 3
     return @{ Version = $version + "00" ; URL32 = $releases + $url.href }
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