if WinActive("ahk_exe chrome.exe") {
PgUp::^Left
PgDn::^Right
XButton1::^PgUp  ;switch to tab on left
XButton2::^PgDn  ;switch to tab on right
return
}
