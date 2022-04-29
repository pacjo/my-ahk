#If GetKeyState("ScrollLock", "T")
{
Numpad8::MouseMove, 0, -20, 5, R
return
Numpad2::MouseMove, 0, 20, 5, R
return
Numpad6::MouseMove, 20, 0, 5, R
return
Numpad4::MouseMove, -20, 0, 5, R
return
Numpad7::Send {LButton}
return
Numpad9::Send {RButton}
return
}
