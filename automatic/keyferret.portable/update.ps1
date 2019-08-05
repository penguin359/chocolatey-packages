import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases     = 'https://www.keyferret.com/get'
    $regexVersion = 'title="Version (?<Version>[\d\.]+)"'
    $regexUrl     = '(?<Url>http://www.keyferret.com/download/[\d\.]+/)'

    $download_page = Invoke-WebRequest -Uri $releases

    $download_page.RawContent -match $regexVersion | Out-Null
    $version = $matches.Version
    $url = $download_page.RawContent | sls -Pattern $regexUrl -AllMatches

    return @{
        Version = $version
        URL32   = $url.Matches[1].Value + 'keyferret-' + $version + '.zip'
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}