$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {    
	# $releases          = 'https://cisco.webex.com/webappng/sites/cisco/dashboard/download'    
    # $downloadUrl_part1 = 'https://akamaicdn.webex.com/client/WBXclient-'
    # $regex             = 'https://cisco.webex.com/client/WBXclient-(?<version>[\d\.-]+)/webexapp.msi'

    $releases          = 'https://help.webex.com/en-us/xcwws1/What-s-New-for-the-Latest-Channel-of-Webex-Meetings'
    $regex             = '[A-Za-z]+\ \d+ \((?<Version>[\d\.]+)\)'

    # $ie = New-Object -com internetexplorer.application
    # $ie.Visible = $false
    # $ie.Navigate($releases)
    # while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    # $ie.Document.body.outerHTML -match $regex | Out-Null

	

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    $urlVersion     = $matches.Version
    $packageVersion = $UrlVersion -replace '-', '.'

    return @{
        Version = $packageVersion
        # URL32   = $downloadUrl_part1 + $urlVersion + '/webexapp.msi'
        URL32   = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
        URL64   = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

update