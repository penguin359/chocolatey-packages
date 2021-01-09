$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge -FileNameSkip 1 -FileNameBase "ispc-v$($Latest.Version)-windows" }

function global:au_GetLatest {
    $releases = 'https://ispc.github.io/downloads.html'
    $regex   = 'ispc-v(?<Version>[\d\.]+)-windows.msi'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url = $download_page.links | ? href -match $regex | Select -First 1

    return @{        
        Version = $matches.Version
        URL32   = (Get-RedirectedUrl $url.href) -replace '(.*)(&response-content-disposition=attachment%3B%20filename%3D.*-windows.zip)(.*)','$1$3$2'
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""          
        }
    }
}

update -ChecksumFor none