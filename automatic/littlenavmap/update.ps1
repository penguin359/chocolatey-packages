import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'albar965/littlenavmap'
    # $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $releases = "https://github.com/" + $github_repository + "/releases"
    # $regex    = "(^/$github_repository/.*LittleNavmap-win-(?<Version>[\d\.]+?).zip)"
    $regex    = "(^/$github_repository/.*LittleNavmap-win-(?<Version>[\d\.]+(\.beta)?).zip)"

    $url_path = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1).href
    $version  = $matches.Version

    if ($version -match '\.beta') {
        $version = $version -replace '\.beta', '-beta'
    }

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