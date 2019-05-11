import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $url = Get-Redirectedurl https://sourceforge.net/projects/qtpfsgui/files/latest/download
  $regex = 'luminance-hdr-(?<Version>[\d\.]+).tar.bz2'

  $url -match $regex | Out-Null
  $version = $matches.Version 
  
  return @{
    Version = $version
    URL32 = 'https://netix.dl.sourceforge.net/project/qtpfsgui/luminance/' + $version + '/Luminance-HDR-x64-v' + $version + '.zip'
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