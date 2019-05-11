import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $url = get-redirectedurl https://download.geogebra.org/package/windows-graphing
    $regex = 'GeoGebraGraphing-Windows-Installer-(?<Version>[\d\-]+).exe'

    $url -match $regex | Out-Null    
    return @{
        Version = $matches.Version -replace '-', '.'
        URL32 = 'https://download.geogebra.org/installers/6.0/graphing/GeoGebraGraphing-Windows-Installer-' + $matches.Version + '.exe'
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
          "(?i)(^\s*[$]file\s*=\s*')(.*)'"   = "`$1$($Latest.FileName32)'"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}