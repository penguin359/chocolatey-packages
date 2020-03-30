import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releasesVersion = 'https://frippery.org/busybox/release-notes/index.html'
    $regexVersion    = 'FRP-(?<Version>[\d\.]+).html'

    (Invoke-WebRequest -Uri $releasesVersion -UseBasicParsing).links | ? href -match $regexVersion | Select -First 1

     return @{
        Version = $matches.Version + '.0'
        URL32   = 'https://frippery.org/files/busybox/busybox.exe'
        URL64   = 'https://frippery.org/files/busybox/busybox64.exe'
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"

        }        
    }
}

update -ChecksumFor none