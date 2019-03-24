# Close botpress
$botpress = Get-Process bp -ErrorAction SilentlyContinue
if ($botpress) { $botprocess | Stop-Process }