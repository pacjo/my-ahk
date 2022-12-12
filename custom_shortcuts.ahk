; Remaps Win+Shift+s to PrintScreen
PrintScreen::#+s
/* return */

; Search highlighted text in Google
^g::
{
  Send "^c"
  Sleep 50
  Run "explorer 'https://www.google.com/search?q=%clipboard%'"
  return
}


^!t::
{
  Send "^c"
  Sleep 50
  Run "https://translate.google.pl/?text=%clipboard%"
  return
}

+Scrolllock::+F9
/* return */

F24::{
MsgBox "f24 detected"
Send "+F9"
return
}

#WheelUp::Send "^#{Right}"
/* return */

#WheelDown::Send "^#{Left}"
/* return */
