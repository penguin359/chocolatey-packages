$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/ffmpeg-batch/files/'
    $regex   = 'FFmpeg_Batch_(?<Version>[\d\.]+)_Portable_x64.zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex | Select -First 1

    return @{
        Version = $matches.Version
        URL32 = Get-RedirectedUrl ('https://downloads.sourceforge.net/project/ffmpeg-batch/FFmpeg_Batch_' + $matches.Version + '_Portable_x86.zip')        
        URL64 = Get-RedirectedUrl ('https://downloads.sourceforge.net/project/ffmpeg-batch/FFmpeg_Batch_' + $matches.Version + '_Portable_x64.zip')
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName32)`""          
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName64)`""          
          "(Join-Path [$]toolsDir `"FFmpeg_Batch_)[\d\.]+(_Portable[$]`{arch`}.exe`")" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

update -ChecksumFor none
