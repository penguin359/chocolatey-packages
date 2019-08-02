import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
    $releases = 'https://ftpmirror.gnu.org/octave/windows/'
    $regex32  = 'octave-(?<Version>[\d\.]+)-w32-installer.exe$'
    $regex64  = 'octave-([\d\.]+)-w64-installer.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32         = $download_page.links | ? href -match $regex32 | select -Last 1
    $version       = $matches.Version
	$url64         = $download_page.links | ? href -match $regex64 | select -Last 1
	
    return @{
        Version = $version
        URL32   = $releases + $url32.href
        URL64   = $releases + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
          "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
          "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"          
        }
        "tools\chocolateyinstall.ahk" = @{
          "Octave-[\d\.]+" = "Octave-$($Latest.Version)"
        }
    }
}

update