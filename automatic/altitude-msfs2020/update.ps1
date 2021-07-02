import-module au

#function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_BeforeUpdate {
    Remove-Item "$PSScriptRoot\tools\*.zip"
    Invoke-WebRequest -Uri 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download' -OutFile "$PSScriptRoot\tools\Altitude_MSFS_2020.zip"

    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32     = Get-RemoteChecksum $Latest.URL32 -Algorithm $Latest.ChecksumType32
}

function global:au_GetLatest {    
    $releases = "https://www.ivao.aero/softdev/beta/altitudebeta.asp"    
    $regex = 'target="dl">v(?<Version>[\d\.b]+) Voice'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).RawContent -match $regex | Out-Null
    #$version = $matches.Version -Replace 'b', '-beta'
    $version = $matches.Version.Replace('b', '-beta')

    return @{
        Version    = $version
        URL32      = 'https://api.ivao.aero/v2/softwares/altitude/5/files/latest/download'        
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none