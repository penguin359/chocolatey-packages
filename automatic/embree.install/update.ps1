import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = "embree/embree"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = 'embree-(?<Version>[\d\.]+).x64.vc[\d]+.msi$'

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1

    return @{
        Version = $matches.Version
        URL64   = "https://github.com" + $url.href
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{
            "(?i)(x64: ).*"       = "`${1}$($Latest.URL64)"
            "(?i)(checksum64:).*" = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}