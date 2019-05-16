import-module au
 
function global:au_GetLatest {
  $releases       = 'https://www.vb-audio.com/Voicemeeter'  
  $regex_version  = 'Voicemeeter (?<Version>[\d\.]+).*\(EXE file\)'

  $download_page  = (Invoke-WebRequest -Uri $releases)
  $download_page.RawContent -match $regex_version
  
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