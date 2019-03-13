# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/jtalert/jtalert.png" width="48" height="48"/> [JTAlert](https://chocolatey.org/packages/jtalert)

Provides several audio and visual alert types based on decoded Callsigns within JT65-HF and WSJT-X.

## Features

- Audio and visual alerts for several alert conditions
	- Your Callsign decoded (someone calling you)
	- CQ & QRZ
	- Wanted Callsign
	- Wanted Prefix (by Band/Mode)
	- Wanted Grid (by Band/Mode)
	- Wanted US State (by Band/Mode)
	- Wanted DXCC (by Band/Mode)
	- Wanted CQ Zone (by Band/Mode)
	- Wanted Continent (by Band/Mode)
	- Wanted CQ Marathon (by Band/Mode)

- Automatic logging to these log types when QSO is logged in JT65-HF or WSJT-X
	- DXLab DXKeeper
	- ACLog
	- Log4OM
	- HRD Log V5/V6
	- Standard ADIF file
	- MixW CSV file

- Various Web Services Supported
	- Online XML Callsign Database lookup. QRZ.com (paid) and HamQTH (free)
	- Upload logged QSO to Online Logbooks. ClubLog.org and HRDLog.net
	- Upload all decoded Callsigns with frequency and Signal report to HamSpots.net

- Works with DXLab applications
	- Automatic log to DXKeeper when JT65-HF or WSJT-X QSO is logged
	- Automatic post decoded Callsigns to SpotCollector (local spots)
	- DXKeeper lookup of previous QSOs with decoded Callsign
	- Send Callsign to Pathfinder for lookup

- Supports user-selectable Sound Card
	- Each audio alert type has independent volume setting & wave file
	- LoTW and eQSL membership flagging of decoded callsigns
	- Band Tracking or alerts. 160m to 2m, including 60m
	- Disable audio alert for Worked

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/jtalert/screenshot.png)