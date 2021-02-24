import-module au

function global:au_GetLatest {
    $url = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'

    $current_checksum = (gi $PSScriptRoot\tools\chocolateyinstall.ps1 | sls '\bchecksum\b') -split "=|'" | Select -Last 1 -Skip 1
    if ($current_checksum.Length -ne 64) { throw "Can't find current checksum" }

    $filePath = "$env:temp\setup.exe"
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
        URL32      = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
        Checksum32 = $remote_checksum
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none
if ($global:au_old_force -is [bool]) { $global:au_force = $global:au_old_force }