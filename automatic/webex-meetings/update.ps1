$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {    
	$releases          = 'https://cisco.webex.com/webappng/sites/cisco/dashboard/download'
    $downloadUrl_part1 = 'https://akamaicdn.webex.com/client/'
    $regex             = 'https://cisco.webex.com/client/(?<downloadUrl_part2>WBXclient-(?<version>[\d\.-]+)/webexapp.msi)'

    $ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releases)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $ie.Document.body.outerHTML -match $regex | Out-Null

	$version           = $matches.Version -replace '-', '.'
    $downloadUrl_part2 = $matches.downloadUrl_part2

    return @{
        Version = $version
        URL32   = $downloadUrl_part1 + $downloadUrl_part2
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
        }
    }
}

update