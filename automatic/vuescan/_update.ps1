import-module au

function global:au_GetLatest {
    $releases = 'https://www.hamrick.com'    
    $regex    = 'Version (?<Version>[\d\.]+)\. '

    $ie = New-Object -com internetexplorer.application
    $ie.Visible = $false
    $ie.Navigate($releases)
    while ($ie.Busy -eq $true){Start-Sleep -seconds 4;}
    $ie.Document.body.outerHTML -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://www.hamrick.com/files/vuex3296.exe'
        URL64   = 'https://www.hamrick.com/files/vuex6496.exe'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update