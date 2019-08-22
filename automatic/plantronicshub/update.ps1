import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
  $releases = 'https://www.plantronics.com/us/en/support/downloads-apps/hub-desktop'
  $regex    = '<b>Version (?<Version>[\d\.]+)</b>'

  (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null

	return @{
    Version = $matches.Version
    URL32   = 'https://www.plantronics.com/content/dam/plantronics/software/PlantronicsHubInstaller.exe'
  }
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