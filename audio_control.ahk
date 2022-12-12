HotIfWinNotActive "Kalkulator"       ;Volume controll with numpad NumpadPlus, NumpadMinus and NumpadEnter
{
NumpadAdd::Send "{Volume_Up}"
/* return */
NumpadSub::Send "{Volume_Down}"
/* return */
NumpadEnter::Send "{Volume_Mute}"
/* return */
NumpadMult::Send "{Media_Play_Pause}"
/* return */
}
