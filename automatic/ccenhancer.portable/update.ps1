import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases      = 'https://singularlabs.com/software/ccenhancer/download-ccenhancer'
    $regex_url     = '^(?<Url>https://singularlabs.com/download/\d+/)$'
    $regex_version = '<td>(?<Version>[\d\.]+)</td>'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex_url | select -Skip 1 -First 1
            
    (Invoke-WebRequest -Uri $releases).RawContent -match $regex_version | Out-Null

     return @{ Version = $matches.Version ; URL32 = $url.href + 'ccenhancer-install-' + $matches.Version + '.zip' }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "([$]toolsDir `"CCEnhancer-multilingual-)[\d\.]+(\\CCEnhancer-)[\d\.]+(.exe`")" = "`${1}$($Latest.Version)`${2}$($Latest.Version)`${3}"
        }
    }
}

update -ChecksumFor none