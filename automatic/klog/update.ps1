import-module au
$releases = 'https://download.savannah.gnu.org/releases/klog/win/'
$regex   = 'KLog-(.*)-windows-installer.exe$'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	 $url = $download_page.links | ? href -match $regex | select -Last 1
	 $version = $url -split '-|.exe' | select -Last 1 -Skip 3
     # When the fourth segment is already used, it is recommended to add two zeroes (00) to the end of the version. Then when you need to fix, you just increment that number.
     $versionNbSegment = ($version.ToCharArray() | Where-Object {$_ -eq '.'} | Measure-Object).Count
     if ($versionNbSegment -eq 3) { $version += "00" }
     return @{ Version = $version ; URL32 = $releases + $url.href }
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