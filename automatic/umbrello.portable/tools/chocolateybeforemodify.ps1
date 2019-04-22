# Close processes
foreach ( $processName in 'dbus-daemon.exe', 'dbus-launch.exe', 'dbus-monitor.exe', 'dbus-send.exe', 'dbus-update-activation-environment.exe', 'drkonqi.exe', 'enchant-lsmod.exe', 'enchant.exe', 'gspawn-win64-helper-console.exe', 'gspawn-win64-helper.exe', 'kbuildsycoca4.exe', 'kcmshell4.exe', 'kconfig_compiler.exe', 'kconf_update.exe', 'kcookiejar4.exe', 'kdbgwin.exe', 'kde4-config.exe', 'kdebugdialog.exe', 'kded4.exe', 'kdeinit4.exe', 'khc_indexbuilder.exe', 'khelpcenter.exe', 'kioslave.exe', 'kio_http_cache_cleaner.exe', 'kjs.exe', 'kjscmd.exe', 'klauncher.exe', 'kmailservice.exe', 'kross.exe', 'ksendbugmail.exe', 'ktelnetservice.exe', 'ktrash.exe', 'kuiserver.exe', 'kwalletd.exe', 'kwinshutdown.exe', 'kwinstartmenu.exe', 'kwrapper4.exe', 'makekdewidgets.exe', 'po2xmi.exe', 'qdbus.exe', 'qdbusviewer.exe', 'umbrello.exe', 'update-mime-database.exe', 'xmi2pot.exe' ){
  $process = Get-Process $processName -ErrorAction SilentlyContinue
  if ($process) {
    $process | Stop-Process
    $process | Wait-Process
  }
}