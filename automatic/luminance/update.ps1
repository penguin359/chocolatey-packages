import-module au
 
function global:au_GetLatest {
  $releases = 'http://qtpfsgui.sourceforge.net/?page_id=10'  
  $regex    = 'Luminance-HDR-x64-SETUP-v(?<Version>[\d\.]+).exe'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing 
  $url = $download_page.links | ? href -match $regex  
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