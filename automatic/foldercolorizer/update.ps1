import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $url = 'https://dl.devmate.com/com.softorino.fc2win/FolderColorizer2.exe'
   
    $current_checksum = (sls -Path $PSScriptRoot\legal\VERIFICATION.txt -Pattern 'checksum32:\ (.*)$').Matches.Groups[1].Value    
    if ($current_checksum.Length -ne 64) { throw "Can't find current checksum" }

    $filePath = "$env:temp\FolderColorizer2.exe"
    Invoke-WebRequest $url -OutFile "$filePath"

    $version = (Get-ItemProperty -Path "$filePath").VersionInfo.ProductVersion

    $Latest.ChecksumType = "sha256"
    $Latest.Checksum = Get-FileHash -Algorithm $Latest.ChecksumType -Path "$filePath" | ForEach-Object Hash

    $remote_checksum  = (Get-FileHash -Path "$filePath").Hash
    if ($current_checksum -ne $remote_checksum) {
        Write-Host 'Remote checksum is different then the current one, forcing update'
        $global:au_old_force = $global:au_force
        $global:au_force = $true
    }

    return @{
        Version    = $version.Trim()
        URL32      = 'https://dl.devmate.com/com.softorino.fc2win/FolderColorizer2.exe'
        Checksum32 = $remote_checksum
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
    if ($global:au_old_force -is [bool]) { $global:au_force = $global:au_old_force }
}