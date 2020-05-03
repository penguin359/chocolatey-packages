# Author: Christophe Lefebvre
# Last Change: 03-May-2020.

<#
.SYNOPSIS   
   Get URL32 and/or URL64 and Version from a GitHub repository.

.DESCRIPTION
   This function helps to get URL 32 and/or URL64 from the latest release available on a GitHub repository. 
#>
function global:au_Helper_GitHub () {
    Param( 
        [parameter(position=0)]
        $GitHubRepository,
        [parameter(position=1)]
        $RegexFile32,
        [parameter(position=2)]
        $RegexFile64
        )

    if ((-Not ($RegexFile32)) -And (-Not ($RegexFile64))) {
        throw ("You must use `"-RegexFile32`" and/or `"-RegexFile64`" switchs.")
    }

    $releases      = 'https://github.com/' + $GitHubRepository + '/releases/latest'
    $regexVersion  = "/$GitHubRepository/tree/(?<Version>[\d\.]+)"
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.Content -match "$regexVersion"
    $result += @{Version = $matches.Version}

    foreach ($arch in "32", "64") {
        $regexFile = (Get-Variable -Name "RegexFile$arch").Value

        if ($regexFile) {
            $url = $download_page.links | ? href -match "/$regexFile"            
            $result += @{"URL$arch" = $('https://github.com' + $url.href)}            
        }
    }

    return $result
}