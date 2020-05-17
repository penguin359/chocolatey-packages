import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'http://www.calluna-software.com/Products/Downloads'
  $regex    = 'NCollectorStudio_(?<Version>[\d\.]+).msi$'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url32         = $download_page.links | ? href -match $regex

  return @{
    Version = $matches.Version
    URL32   = 'http://www.calluna-software.com/downloads/ncollector/' + $matches.0
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
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