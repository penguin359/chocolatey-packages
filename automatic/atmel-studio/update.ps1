import-module au

function global:au_GetLatest {
    $releases = 'https://www.microchip.com/mplab/avr-support/atmel-studio-7'
    $regex    = 'as-installer-(?<Version>[\d\.]+)-full.exe'

    $ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releases)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $ie.Document.body.outerHTML -match $regex | Out-Null

	$version = $matches.Version

    return @{
        Version = $version
        URL32   = 'http://studio.download.atmel.com/' + $version + '/as-installer-' + $version + '-full.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update