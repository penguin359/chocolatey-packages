import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
	$releases = 'https://kid3.sourceforge.io/'
	$regex    = 'kid3-(?<Version>[\d\.]+)-win32.zip'

	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url     = $download_page.links | ? href -match $regex
  $version = $matches.Version
	
	return @{
    Version = $version
    URL32   = 'https://freefr.dl.sourceforge.net/project/kid3/kid3/' + $version + '/kid3-' + $version + '-win32.zip'
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""          
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}