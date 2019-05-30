import-module au

function global:au_GetLatest {
    $releases = 'https://github.com/serge-rgb/milton/releases/latest'
    $regex   = 'MiltonSetup_(?<Version>[\d\.]+)_x64.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex
    return @{ Version = $matches.Version ; URL64 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -NoCheckUrl
}