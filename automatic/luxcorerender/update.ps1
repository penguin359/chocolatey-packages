$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://luxcorerender.org/download'
    $regex    = 'luxcorerender-v(?<Version>[\d\.]+)-win64.zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.Version ; URL64 = $url.href }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName64)`""          
          "(Join-Path [$]toolsDir `"luxcorerender-v)[\d\.]+(-win64\\luxcoreui.exe`")" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    try {
        update -ChecksumFor none
    } catch {
        $ignore = 'The request was aborted: Could not create SSL/TLS secure channel.'
        if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
    }
}
