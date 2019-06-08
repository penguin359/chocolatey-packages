import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/mbox-viewer/files/'
    $regex    = '/projects/mbox-viewer/files/v(?<Version>[\d\.]+)/'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url           = $download_page.links | ? href -match $regex | select -First 1
    $version       = $matches.Version

    return @{ Version = $version ; URL = "https://sourceforge.net" + $url.href + "mbox-viewer.exe-v" + $version + ".zip" }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}