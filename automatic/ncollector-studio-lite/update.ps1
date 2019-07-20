import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'http://www.calluna-software.com/Products/Downloads'
  $regex    = '<td>(?<Version>[\d\.]+) \(<a href=\"/Products/ChangeLog\"'

  (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null
  
  return @{
    Version = $matches.Version
    URL32   = 'http://www.calluna-software.com/downloads/ncollector/NCollectorStudioLite.msi'
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
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