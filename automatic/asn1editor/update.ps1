import-module au

function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.zip"
    Invoke-WebRequest -Uri $Latest.URL32 -OutFile "$PSScriptRoot\tools\$($Latest.FileName32)"

    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_GetLatest {
    $releases  = 'https://www.pkisolutions.com/tools/asn1editor/'
    $regex     = '(?<Filename>Asn1Editor-v(?<Version>[\d\.]+)\.zip)'    
    $regex_url = 'href="(?<Url>.*/download/\d+/)"'

    $download_page = Invoke-WebRequest -Uri $releases
    $download_page -match $regex | Out-Null
    $version  = $matches.Version
    $filename = $matches.Filename

    $download_page -match $regex_url | Out-Null

    return @{ Version = $version ; FileName32 = $filename ; URL32 = $matches.Url }
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
           "(^.*`"Asn1Editor-v)[\d\.]+(.*)$" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -noCheckUrl
}