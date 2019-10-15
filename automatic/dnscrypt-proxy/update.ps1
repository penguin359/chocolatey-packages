$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = "jedisct1/dnscrypt-proxy"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex32 = "/dnscrypt-proxy-win32-([\d\.]+?(-beta\.[\d]+)).zip$"
    $regex64 = "/dnscrypt-proxy-win64-(?<Version>[\d\.]+?(-beta\.[\d]+)).zip$"
    $urls  = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $url32 = $urls | ? href -match $regex32
    $url64 = $urls | ? href -match $regex64
    $version = $matches.Version -Replace "beta\.", "beta"

    return @{
        Version = $version
        URL32   = "https://github.com/" + $url32.href
        URL64   = "https://github.com/" + $url64.href
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
        	"(?i)(^\s*filefullpath\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        	"(?i)(^\s*filefullpath64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""          
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
