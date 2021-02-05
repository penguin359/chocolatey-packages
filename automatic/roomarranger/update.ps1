import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'http://www.roomarranger.com/whatsnew.txt'
  $regex = 'version (?<Version>[\d\.]+) \('

  (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
  $version_url = $matches.Version -Replace '\.', ''

  return @{
      Version = $matches.Version
      URL32   = 'https://www.roomarranger.com/prg/rooarr' + $version_url + '.exe'
      URL64   = 'https://www.roomarranger.com/prg/rooarr' + $version_url + '_64bit.exe'      
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none