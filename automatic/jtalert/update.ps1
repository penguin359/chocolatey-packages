import-module au

function global:au_GetLatest {
    $releases    = 'https://hamapps.com/JTAlert/'
    #$regex_win10 = '(HamApps_)?JTAlert[_\.]AL[_\.](.*?)[_\.]Setup.exe">Download'
    $regex       = '(HamApps_)?JTAlert[_\.](?<Version>.*?)[_\.]Setup.exe">Download'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	#$url_win10     = $download_page.links | ? outerHTML -match $regex_win10 | select -Last 1	
	
    $url = $download_page.links | ? outerHTML -match $regex | select -First 1

    return @{ Version = $matches.Version ; URL32 = $url.href }
}

function global:au_SearchReplace {
    #$Checksum32_win10 = Get-RemoteChecksum "$($Latest.URL32_win10)"
    @{
        "tools\chocolateyInstall.ps1" = @{
            #"(^(\s)*\`$url_others\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*\`$url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            #"(^(\s)*\`$checksum_others\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*\`$checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            #"(^(\s)*\`$url_win10\s*=\s*)('.*')" = "`$1'$($Latest.URL32_win10)'"
            #"(^(\s)*\`$checksum_win10\s*=\s*)('.*')" = "`$1'$($Checksum32_win10)'"
        }
    }
}

update -NoCheckUrl