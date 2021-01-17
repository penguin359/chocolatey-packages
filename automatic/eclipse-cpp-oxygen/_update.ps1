. $PSScriptRoot\..\eclipse-cpp\update.ps1

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"eclipse-cpp`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

update -ChecksumFor none
