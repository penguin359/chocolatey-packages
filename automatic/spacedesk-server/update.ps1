import-module au

function global:au_GetLatest {
    $releases = 'https://spacedesk.net'
    $regex = 'spacedesk DRIVER Beta III v(?<Version>[\d\.]+)\</td\>'
    
    $url32 = Get-RedirectedUrl https://spacedesk.net/downloadidd32
    $url64 = Get-RedirectedUrl https://spacedesk.net/downloadidd64
    $url32_win7_81 = Get-RedirectedUrl https://spacedesk.net/downloadlegacy
    $url64_win7_81 = Get-RedirectedUrl https://spacedesk.net/downloadlegacy64
    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32 = $url32
        URL64 = $url64
        URL32_win7_81 = $url32_win7_81
        URL64_win7_81 = $url64_win7_81
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*\`$url32_win10\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*\`$checksum32_win10\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*\`$url64_win10\s*=\s*)('.*')"        = "`$1'$($Latest.URL32_win10)'"
            "(^(\s)*\`$checksum64_win10\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32_win10)'"
            "(^(\s)*\`$url32_win7_81\s*=\s*)('.*')"      = "`$1'$($Latest.URL32_win7_81)'"
            "(^(\s)*\`$checksum32_win7_81\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32_win7_81)'"
            "(^(\s)*\`$url64_win7_81\s*=\s*)('.*')"      = "`$1'$($Latest.URL64_win7_81)'"
            "(^(\s)*\`$checksum64_win7_81\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64_win7_81)'"
        }
    }
}

update
