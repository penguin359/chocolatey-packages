import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'https://download.kde.org/stable/umbrello/latest/win32/'
  $regex    = 'umbrello-i686-w64-mingw32-(?<Version>[\d\.]+).*-bin.7z$'
  
  $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing)
  $file = $download_page.links | ? href -match $regex
  return @{ Version = $matches.Version ; URL32 = 'https://download.kde.org/stable/umbrello/latest/win32/' + $file.href }
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
          "umbrello-[\d\.]+(\bin\umbrello.exe)" = "umbrello-$($Latest.Version)`$1"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}