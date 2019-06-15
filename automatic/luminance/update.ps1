import-module au
 
function global:au_GetLatest {
 $releases = 'https://sourceforge.net/projects/qtpfsgui'
  # $regex    = 'Luminance-HDR-x64-SETUP-v(?<Version>[\d\.]+).exe'  
  $regex    = 'Luminance-HDR_v\.(?<Version>[\d\.]+)_Windows_64.exe'

  (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null  

  return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl