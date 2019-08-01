import-module au

function global:au_GetLatest {
  $releases = 'https://download.kde.org/stable/umbrello/latest/win32'
  $regex    = 'umbrello-(i686-)?(w64-)?mingw32-(?<Version>[\d\.]+).*-setup.exe$'

  $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing)
  $file = $download_page.links | ? href -match $regex  

  return @{
    Version = $matches.Version
  }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl