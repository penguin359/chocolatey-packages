$ErrorActionPreference = 'Stop';

foreach ( $file in 'smtube.exe', 'Qt5WebKit.dll', 'Qt5Sql.dll', 'Qt5Qml.dll', 'Qt5Quick.dll', 'Qt5Positioning.dll', 'Qt5Multimedia.dll', 'Qt5Sensors.dll', 'Qt5WebChannel.dll', 'Qt5WebKitWidgets.dll', 'Qt5OpenGL.dll', 'Qt5PrintSupport.dll', 'Qt5MultimediaWidgets.dll', 'icuin57.dll', 'icuuc57.dll', 'icudt57.dll', 'translations\smtube_*.qm', 'Copying.txt', 'Readme.txt', 'Release_notes.txt' ){
  Remove-Item -Path "$env:ProgramFiles\SMPlayer\$file" | Out-Null
}