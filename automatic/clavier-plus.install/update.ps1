import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github     = 'https://github.com/'
    $repository = 'guilryder/clavier-plus'

    $github_repository = $github + $repository
    $releases = $github_repository + '/releases/latest'
    $regexVersion = '/tree/release(?<Version>[\d\.]+)'
    $regexUrl = 'ClavierSetup.exe'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regexVersion | Out-Null
    $version = $matches.Version
    $path = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regexUrl).href

     return @{
        Version = $matches.Version
        URL64   = 'https://github.com' + $path
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor 64
}