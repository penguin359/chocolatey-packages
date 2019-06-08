import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://www.sysadmins.lv/projects/asn1editor/default.aspx'
    $regex    = 'Asn1Editor-v(?<Version>[\d\.]+)'
    $regex_url = '(?<Url>/dl/\d+.aspx)'
    
    $download_page = Invoke-WebRequest -Uri $releases
    $download_page -match $regex | Out-Null
    $version = $matches.Version

    $download_page -match $regex_url | Out-Null

    return @{ Version = $version ; URL32 = 'https://www.sysadmins.lv' + $matches.Url }
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
          "Asn1Editor-v([\d\.]+)\\Asn1Editor-x[$]{OSArchitectureWidth}.exe" = "Asn1Editor-v$($Latest.Version)\Asn1Editor-x`${OSArchitectureWidth}.exe"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}