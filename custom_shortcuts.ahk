MsgBox, sdgvdgfdgh

; Remaps Win+Shift+s to PrintScreen
PrintScreen::#+s
return

; Search highlighted text in Google
^g::
{
  Send, ^c
  Sleep 50
  Run, https://www.google.com/search?q=%clipboard%
  Return
}


^!t::
{
  Send, ^c
  Sleep 50
  Run, https://translate.google.pl/?text=%clipboard%
  Return
}

F24::
+F9
return

#WheelUp::Send, ^#{Right}
return

#WheelDown::Send, ^#{Left}
return
