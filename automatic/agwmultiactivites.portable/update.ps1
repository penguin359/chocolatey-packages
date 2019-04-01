import-module au

$releases = 'http://f1agw.free.fr/AGW_Multi_Activites/AGW_Multi_Activites.htm'

function global:au_GetLatest {  
  $download_page = Invoke-WebRequest -Uri $releases
  $regex   = 'V([\d\.]+) le '
  $version = ([regex]::matches($download_page, $regex) | Select-Object -Last 1).Value -replace $regex, "`$1"
  $version_download = $version -replace "\.", ""
  return @{ Version = $version ; URL32 = "http://f1agw.free.fr/AGW_Multi_Activites/AGW_Multi_Activites_" + $version_download + "_SI.zip" }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update