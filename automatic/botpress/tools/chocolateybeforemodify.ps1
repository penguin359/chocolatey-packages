# Close botpress
$botpress = Get-Process bp -ErrorAction SilentlyContinue
if ($botpress) { $botpress | Stop-Process }