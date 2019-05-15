import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'http://qtpfsgui.sourceforge.net/?page_id=10'
  $regex    = '(?<Url>.*/Luminance-HDR-x64-SETUP-v(?<Version>[\d\.]+).exe).*'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $download_page.links | ? href -match $regex | Out-Null
  
  return @{ Version = $matches.Version ; URL64 = $matches.Url }
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