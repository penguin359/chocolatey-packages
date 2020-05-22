import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_GetLatest {
  $releases = 'https://www.poly.com/us/en/support/downloads-apps/hub-desktop'
  $regex    = 'Version (?<Version>[\d\.]+)<'

  (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -match $regex | Out-Null

	return @{
    Version = $matches.Version
    URL32   = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
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