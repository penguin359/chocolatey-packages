import-module au
 
function global:au_GetLatest {
  $releases = 'https://www.radiantviewer.com/download/?src=mbst&f=setup'
  $regex    = '/files/RadiAnt-(?<Version>[\d\.]+)-Setup.exe$'

  $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex

  return @{ Version = $matches.Version ; URL32 = 'https://www.radiantviewer.com' + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
          "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
          "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update