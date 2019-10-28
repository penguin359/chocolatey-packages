$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://github.com/UB-Mannheim/tesseract/wiki'
    $regex32  = 'tesseract-ocr-w32-setup-v([\d\.-]+?(-alpha)?([\d\.]+)).exe'
    $regex64  = 'tesseract-ocr-w64-setup-v(?<Version>[\d\.]+?(-alpha)?([\d\.]+)).exe'    

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$url32         = $download_page.links | ? href -match $regex32
    $url64         = $download_page.links | ? href -match $regex64
    $version       = $matches.Version -Replace "([\d\.]+)(-alpha)([\d\.]+)", '$1$3$2'

    return @{
        Version = $version
        URL32   = $url32.href
        URL64   = $url64.href
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
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}