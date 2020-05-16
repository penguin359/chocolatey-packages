$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc5ed762df7d4c047ed8455f7e89.dl.dropboxusercontent.com/cd/0/get/A3jjVOZq0bYAzsQPpBx22hcqaE4ffHZ8yTUqGIQdunqK9m3Z1dcS4AokZahLJjwjnN-gn_YcOTblJ1tPlhD8aWQT0A4NtUL4sIaBBU-ksB4R6pKkq-Hm7xndDaNxr4JCsbo/file?dl=1#'
  checksum     = 'cd5fbab07865ef3eae9064cceeab0a71ffce4bcfadb3828668121496c8af43ea'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
