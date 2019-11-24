import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  #$releases = 'https://sourceforge.net/projects/ngspice/files/ng-spice-rework'  
  #$regex    = 'title="/ng-spice-rework/\d+/ngspice-(?<Version>[\d]+)_64.zip'
  $releases  = 'https://sourceforge.net/p/ngspice/news/'
  $regex     = 'ngspice-(?<Version>[\d]+) is available.'

  $download_page = (Invoke-WebRequest -Uri $releases).RawContent -match $regex
  
  return @{
    Version = $matches.Version + ".0"
    URL64 = 'https://freefr.dl.sourceforge.net/project/ngspice/ng-spice-rework/' + $matches.Version + '/ngspice-' + $matches.Version + '_64.zip'
  }
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