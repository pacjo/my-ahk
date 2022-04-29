#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ************************** Menu settings **************************

Menu, Tray, Tip, MasterAHK
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
Menu, Tray, Add, &Exit, EXIT_HANDLER

; *********************** Run script af admin ***********************

full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
; MsgBox A_IsAdmin: %A_IsAdmin%`nCommand line: %full_command_line%
InstallLocation := SubStr(A_AhkPath, 1, StrLen(A_AhkPath) - StrLen("Autohotkey.exe"))
; MsgBox % "install location: " SubStr(A_AhkPath, 1, StrLen(A_AhkPath) - StrLen("Autohotkey.exe"))
; MsgBox, %InstallLocation%

; ******************** Read values from ini file ********************

; Default values (get changed if setting.ini exists):
RunOnSystemBoot := 0
AdvancedAltTab := 0
AlwaysOnTop := 0
AppSpecific := 0
AudioControl := 0
CommonFileOpener := 0
CustomShortcuts := 0
MouseOnNumpad := 0

IniRead, RunOnSystemBoot, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, RunOnSystemBoot
IniRead, AdvancedAltTab, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, AdvancedAltTab
IniRead, AlwaysOnTop, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, AlwaysOnTop
IniRead, AppSpecific, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, AppSpecific
IniRead, AudioControl, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, AudioControl
IniRead, CommonFileOpener, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, CommonFileOpener
IniRead, CustomShortcuts, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, CustomShortcuts
IniRead, MouseOnNumpad, %A_MyDocuments%\AutoHotKey\settings.ini, Settings, MouseOnNumpad

;MsgBox, %RunOnSystemBoot%, %AdvancedAltTab%, %AlwaysOnTop%, %AppSpecific%, %AudioControl%, %CommonFileOpener%, %CustomShortcuts%, %MouseOnNumpad%

; *********************** Update tray entries ***********************

; If (AdvancedAltTab = 1)
;   Menu, Tray, Check, Advanced Alt-Tab
; If (AlwaysOnTop = 1)
;   Menu, Tray, Check, Always On Top
; If (AppSpecific = 1)
;   Menu, Tray, Check, App specific shortcuts
; If (AudioControl = 1)
;   Menu, Tray, Check, Audio control
; If (CommonFileOpener = 1)
;   Menu, Tray, Check, Common file opener
; If (CustomShortcuts = 1)
;   Menu, Tray, Check, Custom shortcuts
; If (MouseOnNumpad = 1)
;   Menu, Tray, Check, Mouse on numpad

; *********************** End autorun section ***********************

return

; ************************** Menu Handlers **************************

RELOAD_HANDLER:
	Reload
return

SUSPEND_HANDLER:
  Suspend
  Menu, Tray, ToggleCheck, &Suspend
return

EXIT_HANDLER:
  ExitApp
return

TITLE_HANDLER:
return

WINDOW-SPY_HANDLER:
  Run %A_AHKPath% %InstallLocation%\WindowSpy.ahk
return

UPDATE-INCLUDE_HANDLER:
return

;Scrpit actions: Suspend & Reload

F1::        ;Suspends AutoHotKey
  Suspend
return
F8::        ;Reloads AutoHotKey
  Reload
return

; due to AHK limitations this SHOULD BE at the end of the script
#include advanced_alt-tab.ahk
#include always_on_top.ahk
#include app_specific.ahk
#include audio_control.ahk
#include common_file_opener.ahk
#include custom_shortcuts.ahk
#include mouse_on_numpad.ahk
