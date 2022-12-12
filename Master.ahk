#Requires AutoHotkey v2.0-beta

; ************************** Menu settings **************************

/* Menu, Tray, Tip, MasterAHK
Menu, Tray, NoStandard
Menu, Tray, Add, MasterAHK, TITLE_HANDLER
Menu, Tray, Disable, MasterAHK

; Menu, Tray, Add
;
; Menu, Tray, Add, Advanced Alt-Tab, UPDATE-INCLUDE_HANDLER
; Menu, Tray, Add, Always On Top, UPDATE-INCLUDE_HANDLER
; Menu, Tray, Add, App specific shortcuts, UPDATE-INCLUDE_HANDLER
; Menu, Tray, Add, Audio control, UPDATE-INCLUDE_HANDLER
; Menu, Tray, Add, Common file opener, UPDATE-INCLUDE_HANDLER
; Menu, Tray, Add, Custom shortcuts, UPDATE-INCLUDE_HANDLER
; Menu, Tray, Add, Mouse on numpad, UPDATE-INCLUDE_HANDLER

Menu, Tray, Add

Menu, Tray, Add, Window Spy, WINDOW-SPY_HANDLER
Menu, Tray, Add, &Reload, RELOAD_HANDLER
Menu, Tray, Add, &Suspend, SUSPEND_HANDLER
Menu, Tray, Add, &Exit, EXIT_HANDLER */

; *********************** Run script af admin ***********************

; #Warn ; For more detailed errors
SendMode "Input"
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

; Run script as administrator
full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

; due to AHK limitations this SHOULD BE at the end of the script
#Include "advanced_alt-tab.ahk"
#Include "always_on_top.ahk"
#Include "app_specific.ahk"
#Include "audio_control.ahk"
#Include "common_file_opener.ahk"
#Include "custom_shortcuts.ahk"
#Include "mouse_on_numpad.ahk"
