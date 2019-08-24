import-module au

function global:au_GetLatest {	
    $github_repository = "xupefei/Locale-Emulator"
    $releases = "https://github.com/" + $github_repository + "/releases/latest"
    $regex    = $github_repository + '/releases/download/.*/Locale.Emulator\.(?<Version>[\d\.]*)[\w-]*.zip'
    
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
	$url = $download_page.links | ? href -match $regex
    return @{ Version = $matches.Version ; URL32 = "https://github.com" + $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\Locale.Emulator.)[\d\.]+(\\LEInstaller.exe)`"" = "`${1}$($Latest.Version)`${2}`""
            "(?i)([$]toolsDir `"Locale.Emulator.)[\d\.]+(\\LEGUI.exe)`"" = "`${1}$($Latest.Version)`${2}`""
        }        
    }
}

update