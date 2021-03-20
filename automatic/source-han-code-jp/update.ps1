Import-Module au

function global:au_GetLatest {
  $github_repository = "adobe-fonts/source-han-code-jp"
  $releases = "https://github.com/" + $github_repository + "/releases/latest"
  $regex   = "/(?<Version>[\d\.]+)[A-Z]*.zip$"

  $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
  return @{
    Version = $matches.Version
    URL32 = "https://github.com" + $url.href
  }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update