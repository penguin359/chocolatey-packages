# Stop service before upgrade or uninstall
$serviceName = "dnscrypt-proxy"

If ((Get-Service "$serviceName" -ErrorAction SilentlyContinue).Status -eq 'Running') {
	Write-Warn "Shutdown of the dnscrypt-proxy service..."
	Stop-Service "$serviceName" -WarningAction SilentlyContinue
}