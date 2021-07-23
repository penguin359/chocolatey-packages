import-module au

function global:au_BeforeUpdate {    
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
  $github_repository = 'NatronGitHub/Natron'
  $releases = 'https://github.com/' + $github_repository + '/releases/latest'
  #$regex64  = 'Natron-(?<Version>[\d\.]+)-Windows-(x86_)?64(bit-setup)?.exe$'
  $regex64  = 'Natron-(?<Version>[\d\.]+)-Windows-(x86_)?64(bit-setup)?.zip$'  

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url64         = $download_page.links | ? href -match $regex64 | select -First 1
  $version       = $matches.Version

    return @{
        Version = $version
        #URL64   = 'https://github.com' + $url64.href
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*url64\s*=\s*)('.*')"          = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')"     = "`${1}'$($Latest.Checksum64)'"          
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}Natron-($Latest.Version)-Windows-64\Setup.exe`""          
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -NoCheckUrl -ChecksumFor 64
}