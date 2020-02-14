import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
	$releases = 'https://kid3.kde.org'
  $regex64  = 'kid3-(?<Version>[\d\.]+)-win32-x64.zip'
	$regex32  = 'kid3-([\d\.]+)-win32.zip'

	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $download_page.links | ? href -match $regex32 | Out-Null
  $file32  = $matches.0
	$download_page.links | ? href -match $regex64 | Out-Null
  $file64  = $matches.0
  $version = $matches.Version
  
	return @{
    Version = $version
    URL32   = 'https://netcologne.dl.sourceforge.net/project/kid3/files/' + $version + '/' + $file32
    URL64   = 'https://netcologne.dl.sourceforge.net/project/kid3/files/' + $version + '/' + $file64    
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
          "([$]toolsDir `"kid3-)[\d\.]+(-win32[$]{architectureWidth}\\kid3.exe)`"" = "`${1}$($Latest.Version)`${2}`""          
        }
    }
}

update -ChecksumFor none