import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'http://www.wings3d.com/?page_id=84'
    $regex    = '<h1>Stable Release (?<Version>[\d\.]+)</h1>'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
	
    return @{ Version = $matches.Version
        URL32 = get-redirectedurl http://www.wings3d.com/redirect_download.php?title=stable_win
        URL64 = get-redirectedurl http://www.wings3d.com/redirect_download.php?title=stable_win64
    }
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
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}