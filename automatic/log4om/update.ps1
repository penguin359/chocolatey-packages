. $PSScriptRoot\..\log4om.install\update.ps1

function global:au_BeforeUpdate { 
    cp  $PSScriptRoot\..\log4om.install\README.md $PSScriptRoot\README.md
}
function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""            
        }
    }
}

update -ChecksumFor none -NoCheckUrl