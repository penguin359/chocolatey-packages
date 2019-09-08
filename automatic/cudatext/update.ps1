import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases        = 'https://www.fosshub.com/CudaText.html'    
    $regexReleaseId  = '"r":"(?<releaseId>.*?)"'
    $regexFileName32 = '"n":"(?<fileName>cudatext-win-x32-[\d\.]+.zip)"'
    $regexFileName64 = '"n":"(?<fileName>cudatext-win-x64-(?<Version>[\d\.]+).zip)"'

    $downloadPage = (Invoke-WebRequest -Uri $releases).Content

    $downloadPage -match $regexReleaseId | Out-Null
    $releaseId = $matches.releaseId

    $downloadPage -match $regexFileName32 | Out-Null
    $fileName32 = $matches.fileName
    $downloadPage -match $regexFileName64 | Out-Null
    $fileName64 = $matches.fileName
    $version    = $match.Version

    $downloadPage -match $regexVersion | Out-Null
    $version = $matches.Version

    $jsonRaw = Invoke-WebRequest -Uri "https://api.fosshub.com/download/" -Method "POST" -Headers @{"referer"="https://www.fosshub.com/";"method"="POST"} -ContentType "application/json; charset=UTF-8" -Body "{`"projectId`":`"5c191d1d0b70535796ca860d`",`"releaseId`":`"$releaseId`",`"projectUri`":`"CudaText.html`",`"fileName`":`"$fileName32`",`"source`":`"CF`"}"
    $json32  = ConvertFrom-Json $jsonRaw
    $jsonRaw = Invoke-WebRequest -Uri "https://api.fosshub.com/download/" -Method "POST" -Headers @{"referer"="https://www.fosshub.com/";"method"="POST"} -ContentType "application/json; charset=UTF-8" -Body "{`"projectId`":`"5c191d1d0b70535796ca860d`",`"releaseId`":`"$releaseId`",`"projectUri`":`"CudaText.html`",`"fileName`":`"$fileName64`",`"source`":`"CF`"}"
    $json64  = ConvertFrom-Json $jsonRaw

    return @{
        Version = $version
        URL32   = $json32.data.url
        URL64   = $json64.data.url
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}https://www.fosshub.com/CudaText.html?dwl=cudatext-win-x32-$($Latest.Version).zip"
            "(?i)(x64: ).*"             = "`${1}https://www.fosshub.com/CudaText.html?dwl=cudatext-win-x64-$($Latest.Version).zip"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}