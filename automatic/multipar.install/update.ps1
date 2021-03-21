import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'Yutaka-Sawada/MultiPar'    
    $regexURL     = "/(?<File>MultiPar[\d]+_setup.exe)"    
    $regexVersion = 'MultiPar/tree/v(?<Version>[\d\.]+)'
    $releases     = 'https://github.com/' + $github_repository + '/releases/latest'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = ($download_page.links | ? href -match $regexURL | Select -Last 1).href    
    ($download_page -match $regexVersion) | Out-Null

    return @{
        Version = $matches.Version
        URL32   = 'https://github.com/' + $url
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