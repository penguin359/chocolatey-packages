import-module au

function global:au_GetLatest {
  $github_repository = 'NatronGitHub/Natron'
  $releases = 'https://github.com/' + $github_repository + '/releases/latest'
  $regex64  = 'Natron-(?<Version>[\d\.]+)-Windows-(x86_)?64(bit)?-no-installer.zip$'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url64         = $download_page.links | ? href -match $regex64 | select -First 1
  $version       = $matches.Version
  
    return @{
        Version = $version
        URL64   = 'https://github.com' + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
          "Natron-[\d\.]+-Windows-x86_[$]{OSArchitectureWidth}bit-no-installer\\bin\\natron.exe" = "Natron-$($Latest.Version)-Windows-x86_`${OSArchitectureWidth}bit-no-installer\bin\natron.exe"
        }
    }
}

update -ChecksumFor 64