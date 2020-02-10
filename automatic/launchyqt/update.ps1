import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {    
    $releases = 'https://github.com/samsonwang/LaunchyQt/releases/latest'
    $regex    = '/samsonwang/LaunchyQt/tree/v(?<Version>[\d\.]+)'
    
    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $version
        URL32 = 'https://github.com/samsonwang/LaunchyQt/releases/download/v' + $version + '/Launchy-' + $version + '-win-x86.7z'
        #URL64 = 'https://github.com/samsonwang/LaunchyQt/releases/download/v' + $version + '/Launchy-' + $version + '-win-amd64.7z'
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            #"(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            #"(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          #"(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
          "(?i)Launchy-[\d\.]+-win"   = "Launchy-$($Latest.Version)-win"
        }
    }
}

update -ChecksumFor none -noCheckUrl