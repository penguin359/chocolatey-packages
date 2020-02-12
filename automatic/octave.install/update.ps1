import-module au

function global:au_GetLatest {
    $releases = 'https://ftpmirror.gnu.org/octave/windows/'
    $regex32  = 'octave-(?<Version>[\d\._]+)-w32-installer.exe$'
    $regex64  = 'octave-([\d\._]+)-w64-installer.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32         = $download_page.links | ? href -match $regex32 | select -Last 1
    $version       = $matches.Version
	$url64         = $download_page.links | ? href -match $regex64 | select -Last 1
	
    return @{
        Version = $version
        URL32   = Get-RedirectedUrl ($releases + $url32.href)
        URL64   = Get-RedirectedUrl ($releases + $url64.href)
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*url\s*=\s*)('.*')"        = "`${1}'$($Latest.URL32)'"
          "(^(\s)*checksum\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum32)'"
          "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"          
        }
        "tools\chocolateyinstall.ahk" = @{
          "Octave-[\d\.]+" = "Octave-$($Latest.Version)"
        }
    }
}

try {
    if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
        update
    }
} catch {
    $ignore = 'The request was aborted: Could not create SSL/TLS secure channel.'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}
