import-module au

function global:au_BeforeUpdate {
    $github_repository = 'AirVPN/Eddie'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'    
    $regex    = 'tree/(?<Version>[\d\.]+)'

    Remove-Item "$PSScriptRoot\tools\*.exe"

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null
    $version = $matches.Version

    $Latest.FileName32 = "eddie-ui_$($version)_windows-10_x86_installer.exe"
    $Latest.URL32 = 'https://airvpn.org/mirrors/eddie.website/download/?platform=windows-10&arch=x86&ui=ui&format=installer.exe&version=' + $version
    Invoke-WebRequest -Uri $Latest.URL32 -OutFile "$PSScriptRoot\tools\$($Latest.Filename32)" | Out-Null    
    $Latest.Checksum32 = checksum -t sha256 "$PSScriptRoot\tools\$($Latest.Filename32)"

    $Latest.FileName64 = "eddie-ui_$($version)_windows-10_x64_installer.exe"
    $Latest.URL64 = 'https://airvpn.org/mirrors/eddie.website/download/?platform=windows-10&arch=x64&ui=ui&format=installer.exe&version=' + $version    
    Invoke-WebRequest -Uri $Latest.URL64 -OutFile "$PSScriptRoot\tools\$($Latest.Filename64)" | Out-Null    
    $Latest.Checksum64 = checksum -t sha256 "$PSScriptRoot\tools\$($Latest.Filename64)"
}

function global:au_GetLatest {
    $github_repository = 'AirVPN/Eddie'
    $releases = 'https://github.com/' + $github_repository + '/releases/latest'    
    $regex    = 'tree/(?<Version>[\d\.]+)'

    $url      = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex   

    return @{
        Version = $matches.Version
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
    update -ChecksumFor none -noCheckUrl
}