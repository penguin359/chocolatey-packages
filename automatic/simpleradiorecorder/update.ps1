$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
  $releases = "https://dennisbabkin.com/srr"
  $regex   = 'ver=(?<Version>[\d\.]*)">Report Errors and Glitches'

  (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
  # When the fourth segment is already used, it is recommended to add two zeroes (00) to the end of the version. Then when you need to fix, you just increment that number.
  $versionNbSegment = ($matches.Version.ToCharArray() | Where-Object {$_ -eq '.'} | Measure-Object).Count
  if ($versionNbSegment -eq 3) { $version += "00" }

  return @{ Version = $version }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        "tools\chocolateyuninstall.ps1" = @{          
            "(^(\s)*SRR_Version\s*=\s*)('.*')" = "`$1$($Latest.Version)"
        }        
    }
}

update
