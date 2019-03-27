# Close activitywatch
$process = Get-Process aw-qt -ErrorAction SilentlyContinue
if ($process) { $process | Stop-Process }