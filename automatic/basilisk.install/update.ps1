import-module au

function global:au_GetLatest {
    $releases = 'https://github.com/MoonchildProductions/UXP/releases'
    $regex    = '\>Basilisk (?<Version>[\d\.]+)'
    
    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.installer.exe'
        URL64   = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.installer.exe'
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