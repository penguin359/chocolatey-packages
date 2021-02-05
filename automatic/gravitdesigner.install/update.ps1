import-module au

function global:au_BeforeUpdate {
    $url = 'https://designer.gravit.io/_downloads/windows/GravitDesignerInstaller.exe'
    
    # https://github.com/majkinetor/au/issues/182
    $Latest.ChecksumType32 = 'sha256'    
    $Latest.Checksum32 = Get-RemoteChecksum $url -Algorithm $Latest.ChecksumType32
}

function global:au_GetLatest {
    $releases = 'https://www.designer.io/changelog'
    $regex   = '<h3>Version (?<Version>[\d\.\-]+)</h3>'
    (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null

	return @{ Version = $matches.Version -replace '-', '.' -replace "(\d+\.\d+\.\d+\.\d+).*", '$1' }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{            
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}