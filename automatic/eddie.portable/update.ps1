import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = 'AirVPN/Eddie'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'    
    $regex    = 'v(?<Version>[\d\.]+).zip$'

    $url     = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
    $version = $matches.Version

    return @{
        Version = $version
        URL32   = 'https://airvpn.org/mirrors/eddie.website/download/?platform=windows-10&arch=x86&ui=ui&format=portable.zip&version=' + $version
        URL64   = 'https://airvpn.org/mirrors/eddie.website/download/?platform=windows-10&arch=x64&ui=ui&format=portable.zip&version=' + $version
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
          "(Join-Path [$]toolsDir `"eddie-ui_)[\d\.]+(_windows-10_x64_portable\Eddie-UI.exe`")" = "`$1$($Latest.Version)`$2"          
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    try {
        update -ChecksumFor none
    } catch {
        $ignore = 'The request was aborted: Could not create SSL/TLS secure channel.'
        if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
    }
}