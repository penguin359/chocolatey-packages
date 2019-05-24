import-module au

function global:au_BeforeUpdate { 
    Invoke-WebRequest -Uri "https://www.raidrive.com/download.latest.php" -Headers @{"Referer"="https://www.raidrive.com/download/"} -OutFile $toolsDir\RaiDrive.exe
    $Latest.Checksum32 = checksum -t sha256 $toolsDir\RaiDrive.exe
}

function global:au_GetLatest {
    $releases = 'https://www.raidrive.com/download'
    $regex   = '\<strong style="font-size: 28px;"\>(?<Version>[\d\.]+)\</strong\>'

    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null

    return @{
        Version = $matches.Version
        URL32 = 'https://www.raidrive.com/download.latest.php'
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -NoCheckUrl
}