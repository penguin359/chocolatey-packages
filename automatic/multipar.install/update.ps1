import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'Yutaka-Sawada/MultiPar'
    $releases     = 'https://github.com/' + $github_repository    
    $regex        = "(.*/MultiPar[\d]+_Setup.exe)"
    $regexVersion = 'Installer version (?<Version>[\d\.]+)'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url_path = ($download_page.links | ? href -match $regex | Select -Last 1).href
    $version = (($download_page.RawContent | Select-String -Pattern $regexVersion -allmatches).matches | Select -last 1).Groups[1].Value

    return @{
        Version = $version
        URL32   = 'https://github.com' + $url_path
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

update -ChecksumFor none