import-module au

function global:au_GetLatest {
    $releases = 'https://altcopy.net'
    $regex    = '<p id="versionPc">Version: (?<Version>[\d\.]+)</p>'

    $ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releases)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $ie.Document.body.outerHTML -match '<p id="versionPc">Version: (?<Version>[\d\.]+)</p>' | Out-Null

    return @{ Version = $matches.Version ; URL32 = 'https://altcopy.net/setup.exe' }
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