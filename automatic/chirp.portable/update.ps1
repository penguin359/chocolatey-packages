import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {	
    $releases = "https://trac.chirp.danplanet.com/chirp_daily/LATEST/"
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = '^chirp-daily-(?<date_url>\d+)-win32.zip$'
    $download_page.links | ? href -match $regex
    $version_YY = $matches.date_url.substring(0, $matches.date_url.length-4)
    $version_MM = $matches.date_url.substring($matches.date_url.length-4, 2)
    $version_DD = $matches.date_url.substring($matches.date_url.length-2)
    $version = $version_YY + "." + $version_MM + "." + $version_DD
    return @{
        Version = $version
        URL32 = 'https://trac.chirp.danplanet.com/chirp_daily/daily-' + $matches.date_url + "/chirp-daily-" + $matches.date_url + '-win32.zip' }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"            
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}