import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'pyzo/pyzo'
    $releases   = "https://github.com/" + $github_repository + "/releases/latest"
    $regex_win7 = 'pyzo-([\d\.]+)-win64-windows7.exe$'
    $regex      = 'pyzo-(?<Version>[\d\.]+)-win64-windows10.exe$'

    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $url_win7 = $download_page | ? href -match $regex_win7 | Select -First 1
    $url      = $download_page | ? href -match $regex | Select -First 1

    return @{
        Version    = $matches.Version
        URL64_win7 = "https://github.com" + $url_win7.href
        URL64      = "https://github.com" + $url.href
    }
}

function global:au_SearchReplace {
    $Checksum64_win7 = Get-RemoteChecksum "$($Latest.URL64_win7)"
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64-win7: ).*"        = "`${1}$($Latest.URL64_win7)"
            "(?i)(x64-win10: ).*"       = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64-win7:).*"  = "`${1} $($Latest.Checksum64_win7)"
            "(?i)(checksum64-win10:).*" = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*\`$file64_win7\s*=\s*`"`$toolsDir`\)(.*)"  = "`${1}$($Latest.FileName64_win7)`""
          "(^(\s)*\`$file64_win10\s*=\s*`"`$toolsDir`\)(.*)" = "`${1}$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor 64
}