import-module au

function global:au_BeforeUpdate {
    $url = 'https://dl.genymotion.com/releases/genymotion-' + $Latest.Version + '/genymotion-' + $Latest.Version + '.exe'

    Invoke-WebRequest -Uri $url -outFile "${env:tmp}\genymotion.exe"
    $Latest.Checksum32 = Get-FileHash -Algorithm sha256 "${env:tmp}\genymotion.exe"
    Remove-Item -Path "${env:tmp}\genymotion.exe"
    $Latest.URL32 = $url
}

function global:au_GetLatest {
    $releases = 'https://www.genymotion.com/product-release-note/desktop'
    $regex    = 'Genymotion Desktop (?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -noCheckUrl -checksumFor none
