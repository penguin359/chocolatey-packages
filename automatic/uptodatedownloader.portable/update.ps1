import-module au
$releases = 'https://www.wintools.info/index.php/uptodate-downloader-changelog'

function global:au_GetLatest {
  $regex   = '>Version: (?<Version>[\d\.]*) \|'
  (Invoke-WebRequest -Uri $releases) -match $regex
  return @{ Version = $matches.Version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update