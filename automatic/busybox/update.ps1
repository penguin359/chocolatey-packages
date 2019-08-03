import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releasesVersion = 'https://frippery.org/busybox/release-notes/index.html'
    $regexVersion    = 'FRP-(?<Version>[\d\.]+).html'

    (Invoke-WebRequest -Uri $releasesVersion -UseBasicParsing).links | ? href -match $regexVersion | Select -First 1

     return @{
        Version = $matches.Version + '.0'
        URL32   = 'https://frippery.org/files/busybox/busybox.exe'
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}