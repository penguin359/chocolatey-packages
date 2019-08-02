foreach ($firefox_path in "C:\Program Files (x86)\Mozilla Firefox", "C:\Program Files\Mozilla Firefox"){    
  if (Test-Path -PathType Container -Path "$firefox_path"){
    Remove-Item -Force -Path "$firefox_path\defaults\pref\local-settings.js"    
    Remove-Item -Force -Path "$firefox_path\distribution\policies.json"
    Remove-Item -Force -Path "$firefox_path\mozilla.cfg"
  }
}