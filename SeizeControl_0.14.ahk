; Redo the GUI using https://github.com/G33kDude/Neutron.ahk
; - Can resize clipped images.
; - Screen Clipper freezes the screen on activation.
; - Code epic pen.

#SingleInstance, Force  ; Force the script to close any other instances of this script. (Run one copy at a time)
#NoEnv
;#ErrorStdOut

ListLines,Off
SetBatchLines, -1 ;Set the script to run at top speed.
SetMouseDelay, -1
CoordMode, Mouse , Screen ;Use the screen as the refrence to get positions from.
SendMode Input
SetWorkingDir %A_ScriptDir%
SetControlDelay, 50
DetectHiddenWindows, On

Global pToken := Gdip_Startup() ;Start Gdip

SetTimer, ToolTipFollowMouse, 25
SetTimer, ToolTipFollowMouse, Off
SetTimer, HB_Button_Hover, 50
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Globalised variables and Default values for settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
version = 0.14
Global version
Global ContextMenu
Global SeizeControl_Gui_Status
;============================================== Global for Creating Gui Dimension and Positons============================================
;Global of Sub_Top_Window's height
Global STWh
;Global for Sub_Bottom_Window's height and y possition
Global SBWh, SBWy
;Global for Sub_Left_Window's and Sub_Right_Window's height
Global SLRWh
;Global for Sub_Left_Window's witdh
Global SLWw
;Global for Sub_Right_Window's witdh and x position
Global SRWw, SRWx
;Global for Sub_Control_Window's x,y,w,h
Global SCWx, SCWy, SCWw, SCWh, SSCWw
;Global for Setting1_Window's height
Global S1Wh
;============================================================ Global for Class ============================================================
Global HB_Button:=[]
Global VD5Tab
Global H4Tab

;============================================================ Switching Windows ===========================================================
STab = 1
STab2 = 1
CTab = 1
HTab = 1

Global STab
Global STab2
Global CTab
Global HTab
;========================================================= Settings for Apperance =========================================================
DefaultButtonSettings()
DefaultTabsSettings()
DefaultToggleSettings()
DefaultOtherSettings()
DefaultButtonSettings(){
	ButtonTextColorTop = EBA8FE
	ButtonTextColorBottom = 000000
	ButtonColor = 002240
	ButtonOutline = 000000
	ButtonHoverOutline = EBA8FE
	ButtonFont = Segoe UI
	ButtonColor2 = 002240
	ButtonColor3 = 002240
	ButtonTextSize = 10
	ButtonColor4 = 002240
	ButtonColor5 = 002240
	ButtonColor6 = 002240
	ButtonColor7 = 002240
}
DefaultTabsSettings(){
	TabTextColor =  EBA8FE
	TabColor = 002240
	TabFont = Arial
	TabPressedColor = 33345A
	TabReleasedColor = 33568A
}
DefaultToggleSettings(){
	ToggleTextColor = EBA8FE
	ToggleColor = 002240
	ToggleFont = Arial
	ToggleTextSize = 10
	ToggleEnabledColor = 5DBCD2
	ToggleDisabledColor = 206080
	ToggleKnobColor = 5DBCD2
	ToggleKnobColor2 = ffffff
}
DefaultOtherSettings(){
	LineColor = 5DBCD2
	TextColor = EBA8FE
	BackgroundColor = 002240
	TextFont = Segoe UI
	EditBoxColor = FF0000
}

Global ButtonTextColorTop, ButtonTextColorBottom, ButtonColor, ButtonOutline, ButtonHoverOutline, ButtonFont, ButtonColor2, ButtonColor3, ButtonTextSize, ButtonColor4, ButtonColor5, ButtonColor6, ButtonColor7
Global TabTextColor, TabColor, TabFont, TabPressedColor, TabReleasedColor
Global ToggleTextColor, ToggleColor, ToggleFont, ToggleTextSize, ToggleEnabledColor, ToggleDisabledColor, ToggleKnobColor, ToggleKnobColor2
Global LineColor, TextColor, BackgroundColor, TextFont, EditBoxColor
;============================================================= Window Settings ============================================================
OpenOnStartUp = Off
StartMinimized = Off
StartCompacted = Off
CloseButtonMinimizesToTray = On
MainWindow_AlwaysOnTop = Off
MainWindow_ToolWindow = Off
;Global
Global OpenOnStartUp
Global StartMinimized, StartMinimized1
Global StartCompacted
Global CloseButtonMinimizesToTray
Global MainWindow_AlwaysOnTop
Global MainWindow_ToolWindow
;============================================================= Hotkey Settings ============================================================
Global CloseAppHotKeyOnOff, CloseAppHotkey
CloseAppHotKeyOnOff = Off
;============================================================== Window Tools ==============================================================
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;WindowSwitch;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Global for Gui variables
Global S1, SHotkey1, SHotKeyOnOff1
Global S2, SHotkey2, SHotKeyOnOff2
Global S3, SHotkey3, SHotKeyOnOff3
;Global for functionality
Global WinName
Global ID1, WinTitle1
Global ID2, WinTitle2
Global ID3, WinTitle3
Global STHotkey, SwitchTabHotKeyOnOff
;Toggle State, on/off
SHotKeyOnOff1 = Off
SHotKeyOnOff2 = Off
SHotKeyOnOff3 = Off
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SetWinTransparency;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SwitchTabsDefaultHotkey = Off
SetWinTransparencyScalingValue = 10
SetWinTransparencyMinimumOpacity = 30
SetWinTransparencyUpHotkeyOnOff = Off
SetWinTransparencyDownHotkeyOnOff = Off
Global SwitchTabsDefaultHotkey
Global SetWinTransparencyScalingValue
Global SetWinTransparencyMinimumOpacity
Global SetWinTransparencyUpHotkeyOnOff, SetWinTransparencyDownHotkeyOnOff, SetWinTransparencyUpHotkey, SetWinTransparencyDownHotkey
;============================================================== Screen Clipper ===========================================================
ScreenShotFilePath := A_Desktop "\Saved Clip" ;C:\Users\User\Desktop\Saved Clip
ScreenClipHotKeyOnOff = Off
EnableScreenClipHotkey = On
EnableScreenClipSave2Clipboard = On
EnableScreenClipSave2Folder = On
EnableScreenClipOverwrite = Off
EnableScreenClipShowCloseButton = On
EnableScreenClipShow_Picture = On
EnableScreenClipGui_Hide = On
EnableScreenClipGui_AlwaysOnTop = On
EnableScreenClipGui_ToolWindow = On
;Toggle State, on/off and default value.
Global ScreenShotFilePath
Global EnableScreenClipHotkey
Global EnableScreenClipSave2Clipboard
Global EnableScreenClipSave2Folder
Global EnableScreenClipOverwrite
Global EnableScreenClipGui_Hide
Global EnableScreenClipShowCloseButton, EnableScreenClipShow_Picture
Global EnableScreenClipGui_AlwaysOnTop, EnableScreenClipGui_ToolWindow
Global ScreenClipHotkey1 ,ScreenClipHotKeyOnOff
;Global for functionality
Global ScreenClipHandles := []
Global ScreenClipIndex := 0
;================================================================ Color Picker ===========================================================
;Default Values for functionality
ColorPickerREDHEXVALUE = 00
ColorPickerGREENHEXVALUE = 00
ColorPickerBLUEHEXVALUE = 00

ColorPickerREDSLIDERVALUE = 00
ColorPickerGREENSLIDERVALUE = 00
ColorPickerBLUESLIDERVALUE = 00

ColorPickerREDDECVALUE = 00
ColorPickerGREENDECVALUE = 00
ColorPickerBLUEDECVALUE = 00

ColorPickerREDMIN1 = 0
ColorPickerREDMAX1 = 255
ColorPickerGREENMIN1 = 0
ColorPickerGREENMAX1 = 255
ColorPickerBLUEMIN1 = 0
ColorPickerBLUEMAX1 = 255
;Global for functionality
Global ColorPickerREDTRIGGER, ColorPickerGREENTRIGGER, ColorPickerBLUETRIGGER

Global ColorPickerREDHEXVALUE, ColorPickerGREENHEXVALUE, ColorPickerBLUEHEXVALUE

Global ColorPickerREDSLIDERVALUE, ColorPickerGREENSLIDERVALUE, ColorPickerBLUESLIDERVALUE

Global ColorPickerREDDECVALUE, ColorPickerGREENDECVALUE, ColorPickerBLUEDECVALUE

Global ColorPickerRGBCOLORBLOCK

GLobal ColorPickerREDMIN1, ColorPickerREDMAX1
GLobal ColorPickerGREENMIN1, ColorPickerGREENMAX1
GLobal ColorPickerBLUEMIN1, ColorPickerBLUEMAX1

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Create or Read Config file  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IfNotExist,SeizeControl Settings_%version%.ini
	{
		IniWrite_All_Variable_Values()
	}else
		{
			IniRead_Variable_Values()
		}

IniWrite_All_Variable_Values(){
	IniWrite,% version, SeizeControl Settings_%version%.ini,Version,version
;========================================================== Values for Apperance ==========================================================
	IniWrite,% ButtonTextColorTop, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonTextColorTop
	IniWrite,% ButtonTextColorBottom, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonTextColorBottom
	IniWrite,% ButtonColor, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor
	IniWrite,% ButtonOutline, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonOutline
	IniWrite,% ButtonHoverOutline, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonHoverOutline
	IniWrite,% ButtonFont, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonFont
	IniWrite,% ButtonColor2, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor2
	IniWrite,% ButtonColor3, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor3
	IniWrite,% ButtonTextSize, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonTextSize
	IniWrite,% ButtonColor4, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor4
	IniWrite,% ButtonColor5, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor5
	IniWrite,% ButtonColor6, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor6
	IniWrite,% ButtonColor6, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor6
	IniWrite,% ButtonColor7, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor7

	IniWrite,% TabTextColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabTextColor
	IniWrite,% TabColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabColor
	IniWrite,% TabFont, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabFont
	IniWrite,% TabPressedColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabPressedColor
	IniWrite,% TabReleasedColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabReleasedColor

	IniWrite,% ToggleTextColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleTextColor
	IniWrite,% ToggleColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleColor
	IniWrite,% ToggleFont, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleFont
	IniWrite,% ToggleTextSize, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleTextSize
	IniWrite,% ToggleEnabledColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleEnabledColor
	IniWrite,% ToggleDisabledColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleDisabledColor
	IniWrite,% ToggleKnobColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleKnobColor
	IniWrite,% ToggleKnobColor2, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleKnobColor2

	IniWrite,% LineColor, SeizeControl Settings_%version%.ini, Apperance-General,LineColor
	IniWrite,% TextColor, SeizeControl Settings_%version%.ini, Apperance-General,TextColor
	IniWrite,% BackgroundColor, SeizeControl Settings_%version%.ini, Apperance-General,BackgroundColor
	IniWrite,% TextFont, SeizeControl Settings_%version%.ini, Apperance-General,TextFont
	IniWrite,% EditBoxColor, SeizeControl Settings_%version%.ini, Apperance-General,EditBoxColor

;========================================================= Values for Window Settings =====================================================
	IniWrite,% OpenOnStartUp, SeizeControl Settings_%version%.ini, Window-Settings,OpenOnStartUp
	IniWrite,% StartMinimized, SeizeControl Settings_%version%.ini, Window-Settings,StartMinimized
	IniWrite,% StartCompacted, SeizeControl Settings_%version%.ini, Window-Settings,StartCompacted

	IniWrite,% CloseButtonMinimizesToTray, SeizeControl Settings_%version%.ini, Window-Settings,CloseButtonMinimizesToTray

	IniWrite,% MainWindow_AlwaysOnTop, SeizeControl Settings_%version%.ini, Window-Settings,MainWindow_AlwaysOnTop
	IniWrite,% MainWindow_ToolWindow, SeizeControl Settings_%version%.ini, Window-Settings,MainWindow_ToolWindow
;========================================================== Values for Hotkey Settings ====================================================
	IniWrite,% CloseAppHotkey, SeizeControl Settings_%version%.ini, Hotkey-Settings,CloseAppHotkey
	IniWrite,% CloseAppHotKeyOnOff, SeizeControl Settings_%version%.ini, Hotkey-Settings,CloseAppHotKeyOnOff

;=========================================================== Values for Window Tools ======================================================
	IniWrite,% SHotkey1, SeizeControl Settings_%version%.ini, Window-Tools,SHotkey1
	IniWrite,% SHotkey2, SeizeControl Settings_%version%.ini, Window-Tools,SHotkey2
	IniWrite,% SHotkey3, SeizeControl Settings_%version%.ini, Window-Tools,SHotkey3
	IniWrite,% SHotKeyOnOff1, SeizeControl Settings_%version%.ini, Window-Tools,SHotKeyOnOff1
	IniWrite,% SHotKeyOnOff2, SeizeControl Settings_%version%.ini, Window-Tools,SHotKeyOnOff2
	IniWrite,% SHotKeyOnOff3, SeizeControl Settings_%version%.ini, Window-Tools,SHotKeyOnOff3
	IniWrite,% STHotkey, SeizeControl Settings_%version%.ini, Window-Tools,STHotkey
	IniWrite,% SwitchTabHotKeyOnOff, SeizeControl Settings_%version%.ini, Window-Tools,SwitchTabHotKeyOnOff

	IniWrite,% SwitchTabsDefaultHotkey, SeizeControl Settings_%version%.ini, Window-Tools,SwitchTabsDefaultHotkey
	IniWrite,% SetWinTransparencyUpHotkeyOnOff, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyUpHotkeyOnOff
	IniWrite,% SetWinTransparencyDownHotkeyOnOff, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyDownHotkeyOnOff
	IniWrite,% SetWinTransparencyUpHotkey, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyUpHotkey
	IniWrite,% SetWinTransparencyDownHotkey, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyDownHotkey
	IniWrite,% SetWinTransparencyScalingValue, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyScalingValue
	IniWrite,% SetWinTransparencyMinimumOpacity, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyMinimumOpacity

;======================================================== Values for Screen Clipper =======================================================
	IniWrite,% ScreenShotFilePath, SeizeControl Settings_%version%.ini, Screen-Clipper,ScreenShotFilePath
	IniWrite,% EnableScreenClipHotkey, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipHotkey
	IniWrite,% EnableScreenClipSave2Clipboard, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipSave2Clipboard
	IniWrite,% EnableScreenClipSave2Folder, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipSave2Folder
	IniWrite,% EnableScreenClipOverwrite, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipOverwrite
	IniWrite,% EnableScreenClipShowCloseButton, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipShowCloseButton
	IniWrite,% EnableScreenClipShow_Picture, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipShow_Picture
	IniWrite,% EnableScreenClipGui_Hide, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipGui_Hide
	IniWrite,% EnableScreenClipGui_Hide, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipGui_AlwaysOnTop
	IniWrite,% EnableScreenClipGui_Hide, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipGui_ToolWindow

	IniWrite,% ScreenClipHotKeyOnOff, SeizeControl Settings_%version%.ini, Screen-Clipper,ScreenClipHotKeyOnOff
	IniWrite,% ScreenClipHotkey1, SeizeControl Settings_%version%.ini, Screen-Clipper,ScreenClipHotkey1
}

IniRead_Variable_Values(){
;========================================================== Values for Apperance ==========================================================
	IniRead, ButtonTextColorTop, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonTextColorTop
	IniRead, ButtonTextColorBottom, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonTextColorBottom
	IniRead, ButtonColor, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor
	IniRead, ButtonOutline, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonOutline
	IniRead, ButtonHoverOutline, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonHoverOutline
	IniRead, ButtonFont, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonFont
	IniRead, ButtonColor2, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor2
	IniRead, ButtonColor3, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor3
	IniRead, ButtonTextSize, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonTextSize
	IniRead, ButtonColor4, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor4
	IniRead, ButtonColor5, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor5
	IniRead, ButtonColor6, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor6
	IniRead, ButtonColor6, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor6
	IniRead, ButtonColor7, SeizeControl Settings_%version%.ini, Apperance-Button,ButtonColor7

	IniRead, TabTextColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabTextColor
	IniRead, TabColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabColor
	IniRead, TabFont, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabFont
	IniRead, TabPressedColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabPressedColor
	IniRead, TabReleasedColor, SeizeControl Settings_%version%.ini, Apperance-Tabs,TabReleasedColor

	IniRead, ToggleTextColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleTextColor
	IniRead, ToggleColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleColor
	IniRead, ToggleFont, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleFont
	IniRead, ToggleTextSize, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleTextSize
	IniRead, ToggleEnabledColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleEnabledColor
	IniRead, ToggleDisabledColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleDisabledColor
	IniRead, ToggleKnobColor, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleKnobColor
	IniRead, ToggleKnobColor2, SeizeControl Settings_%version%.ini, Apperance-Toggle,ToggleKnobColor2

	IniRead, LineColor, SeizeControl Settings_%version%.ini, Apperance-General,LineColor
	IniRead, TextColor, SeizeControl Settings_%version%.ini, Apperance-General,TextColor
	IniRead, BackgroundColor, SeizeControl Settings_%version%.ini, Apperance-General,BackgroundColor
	IniRead, TextFont, SeizeControl Settings_%version%.ini, Apperance-General,TextFont
	IniRead, EditBoxColor, SeizeControl Settings_%version%.ini, Apperance-General,EditBoxColor
;========================================================= Values for Window Settings =====================================================
	IniRead, OpenOnStartUp, SeizeControl Settings_%version%.ini, Window-Settings,OpenOnStartUp
	IniRead, StartMinimized, SeizeControl Settings_%version%.ini, Window-Settings,StartMinimized
	IniRead, StartCompacted, SeizeControl Settings_%version%.ini, Window-Settings,StartCompacted

	IniRead, CloseButtonMinimizesToTray, SeizeControl Settings_%version%.ini, Window-Settings,CloseButtonMinimizesToTray

	IniRead, MainWindow_AlwaysOnTop, SeizeControl Settings_%version%.ini, Window-Settings,MainWindow_AlwaysOnTop
	IniRead, MainWindow_ToolWindow, SeizeControl Settings_%version%.ini, Window-Settings,MainWindow_ToolWindow
;========================================================== Values for Hotkey Settings ====================================================
	IniRead, CloseAppHotkey, SeizeControl Settings_%version%.ini, Hotkey-Settings,CloseAppHotkey
	IniRead, CloseAppHotKeyOnOff, SeizeControl Settings_%version%.ini, Hotkey-Settings,CloseAppHotKeyOnOff
;=========================================================== Values for Window Tools ======================================================
	IniRead, SHotkey1, SeizeControl Settings_%version%.ini, Window-Tools,SHotkey1
	IniRead, SHotkey2, SeizeControl Settings_%version%.ini, Window-Tools,SHotkey2
	IniRead, SHotkey3, SeizeControl Settings_%version%.ini, Window-Tools,SHotkey3
	IniRead, SHotKeyOnOff1, SeizeControl Settings_%version%.ini, Window-Tools,SHotKeyOnOff1
	IniRead, SHotKeyOnOff2, SeizeControl Settings_%version%.ini, Window-Tools,SHotKeyOnOff2
	IniRead, SHotKeyOnOff3, SeizeControl Settings_%version%.ini, Window-Tools,SHotKeyOnOff3
	IniRead, STHotkey, SeizeControl Settings_%version%.ini, Window-Tools,STHotkey
	IniRead, SwitchTabHotKeyOnOff, SeizeControl Settings_%version%.ini, Window-Tools,SwitchTabHotKeyOnOff

	IniRead, SwitchTabsDefaultHotkey, SeizeControl Settings_%version%.ini, Window-Tools,SwitchTabsDefaultHotkey
	IniRead, SetWinTransparencyUpHotkeyOnOff, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyUpHotkeyOnOff
	IniRead, SetWinTransparencyDownHotkeyOnOff, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyDownHotkeyOnOff
	IniRead, SetWinTransparencyUpHotkey, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyUpHotkey
	IniRead, SetWinTransparencyDownHotkey, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyDownHotkey
	IniRead, SetWinTransparencyScalingValue, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyScalingValue
	IniRead, SetWinTransparencyMinimumOpacity, SeizeControl Settings_%version%.ini, Window-Tools,SetWinTransparencyMinimumOpacity
;======================================================== Values for Screen Clipper =======================================================
	IniRead, ScreenShotFilePath, SeizeControl Settings_%version%.ini, Screen-Clipper,ScreenShotFilePath
	IniRead, EnableScreenClipHotkey, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipHotkey
	IniRead, EnableScreenClipSave2Clipboard, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipSave2Clipboard
	IniRead, EnableScreenClipSave2Folder, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipSave2Folder
	IniRead, EnableScreenClipOverwrite, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipOverwrite
	IniRead, EnableScreenClipShowCloseButton, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipShowCloseButton
	IniRead, EnableScreenClipShow_Picture, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipShow_Picture
	IniRead, EnableScreenClipGui_Hide, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipGui_Hide
	IniRead, EnableScreenClipGui_Hide, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipGui_AlwaysOnTop
	IniRead, EnableScreenClipGui_Hide, SeizeControl Settings_%version%.ini, Screen-Clipper,EnableScreenClipGui_ToolWindow

	IniRead, ScreenClipHotKeyOnOff, SeizeControl Settings_%version%.ini, Screen-Clipper,ScreenClipHotKeyOnOff
	IniRead, ScreenClipHotkey1, SeizeControl Settings_%version%.ini, Screen-Clipper,ScreenClipHotkey1
}

if (StartCompacted = "On"){
	;TogWinTab:=!TogWinTab
	ContextMenu = 1
} else {
	ContextMenu = 0
}
if (StartMinimized = "On"){
	StartMinimized1 = 1
}

if (OpenOnStartUp = "On"){
	FileCreateShortcut,%A_ScriptFullPath%, C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\SeizeControl_%version%.lnk
	FileCreateShortcut,%A_ScriptFullPath%, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\SeizeControl_%version%.lnk
}
if (OpenOnStartUp = "Off"){
	FileDelete, C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\SeizeControl_%version%.lnk
	FileDelete, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\SeizeControl_%version%.lnk
}

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Create Gui  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Create_Tray_Menu()
;Control for Control_Window dimension and position
SCWx = 170
;vertical placement of inner Gui
SCWy = 61
SCWh = 235
;Sub_Left_Window width
SLWw = 11
;Sub_Right_Window width
SRWw := 10
;Setting1_Window height
S1Wh := 35
;calculations
GUI_Placement_Calculation()
GUI_Placement_Calculation(){
	STWh := SCWy
	SSCWw := SCWx-SLWw
	SBWh := 350-SCWy-SCWh
	SCWw := 740-SCWx-SRWw
}
;Create Gui
Create_Main_Window() ;Gui 1
StartMinimized1 = 0
Create_SubTop_Window() ;Gui 2
Create_SubBottom_Window() ;Gui 3
Create_SubLeft_Window() ;Gui 4
Create_SubRight_Window() ;Gui 5

Create_SubControl_Window() ;Gui SubControl
Create_Control1_Window() ;Gui 6
;Create_Control2_Window() ;Gui C2
;Create_Control3_Window() ;Gui C3
;Create_Control3a_Window() ;Gui C3a ;ParentC3
;Create_Control4_Window() ;Gui C4

;Create_SubSetting_Window() ;Gui SubSeting
;Create_Setting1_Window() ;Gui S1
;Create_Setting2_Window() ;Gui S2
;Create_Setting3_Window() ;Gui S3
;Create_Setting4_Window() ;Gui S4
;Create_Setting5_Window() ;Gui S5

;Create_Setting6_Window() ;Gui S6
;Create_Setting7_Window() ;Gui S7


;Create_SubHelp_Window() ;Gui SubHelp
;Create_Help1_Window() ;Gui H1
;Create_Help2_Window() ;Gui H2
;Create_Help3_Window() ;Gui H3

;Create_SubAbout_Window() ;Gui SubAbout
;Create_About1_Window() ;Gui A1

Return ;End of auto execute
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ LastFound and Outer Skirts of the Interface Window \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Create_Main_Window(){
	Gui, 1: -DPIScale -Caption +LastFound
	HB_Button.Push(New Logo_Button(x:=0, y:=0, window:="1", Label:="GuiContextMenu"))
	If (ContextMenu = 1){
		Winset,Transcolor,Clear
	    Gui,1:Color,Clear
		Gui, 1: -DPIScale -Caption +LastFound +AlwaysOnTop
		Gui,1:Show, w47 h50, Zseni's Master Tool
	}
	If (ContextMenu = 0){
	    Gui,1:Color,% BackgroundColor
		Gui,1:Show, w740 h350, Zseni's Master Tool
    }

	if (StartMinimized1 = 1){
        Gui,1:Hide
		SeizeControl_Gui_Status = Hide
	}
	if (MainWindow_AlwaysOnTop = "Off" and ContextMenu = 0){
		Gui, 1: -DPIScale -Caption +LastFound -AlwaysOnTop
	}else{
		Gui, 1: -DPIScale -Caption +LastFound +AlwaysOnTop
    }
	if (MainWindow_ToolWindow = "Off"){
		Gui, 1: -DPIScale -Caption +LastFound -ToolWindow
	}else{
		Gui, 1: -DPIScale -Caption +LastFound +ToolWindow
    }
}

Create_SubTop_Window(){
    New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "2" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubTop_Window() )
    HB_Button.Push(New Buttons_1(x:=655, y:=5, w:=40, h:=40, window:="2", Label:="GuiMinimize", Text:="-", y_Offset:=0 ))

	if (CloseButtonMinimizesToTray = "On"){
		HB_Button.Push(New Buttons_1(x:=695, y:=5, w:=40, h:=40, window:="2", Label:="GuiHide", Text:="X", y_Offset:=0 ))
	} else {
		HB_Button.Push(New Buttons_1(x:=695, y:=5, w:=40, h:=40, window:="2", Label:="CloseApp", Text:="X", y_Offset:=0 ))
    }

	Gui,2:Add,Text,x5 y5 w650 h40 BackgroundTrans gMove_Window
	Gui,2:Color,% BackgroundColor
	Gui,2:Show,% "w740" "y0" "x0 " "h" STWh
}
SubTop_Window(){
	pBitmap:=Gdip_CreateBitmap( 740 , 350 )
	G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 4 )
	;----------------------------------------------------------------
		cc:="0xFF"BackgroundColor
		Match := StrSplit(RegExReplace(cc, "^0x(..)(..)(..)(..)$", "0x$1 0x$2 0x$3 0x$4"), " ")
		cc := Format("0x{:02X}{:02X}{:02X}{:02X}", Match.1, Max(Match.2-0x00,0), Max(Match.3-0x00,0), Max(Match.4+0x11,0))
		Brush := Gdip_BrushCreateSolid( cc )
	;----------------------------------------------------------------
	Gdip_FillRectangle( G , Brush , 50 , 13 , 100 , 24 )
	Gdip_DeleteBrush( Brush )
	;----------------------------------------------------------------
	    cc:="0xFF"LineColor ;5DBCD2
		Match := StrSplit(RegExReplace(cc, "^0x(..)(..)(..)(..)$", "0x$1 0x$2 0x$3 0x$4"), " ")
		ccd := Format("0x{:02X}{:02X}{:02X}{:02X}", Match.1, Max(Match.2-0x03,0), Max(Match.3-0x10,0), Max(Match.4+0x20,0))
		Match := StrSplit(RegExReplace(ccd, "^0x(..)(..)(..)(..)$", "0x$1 0x$2 0x$3 0x$4"), " ")
		cc := Format("0x{:02X}{:02X}{:02X}{:02X}", Match.1, Max(Match.2-0x05,0), Max(Match.3-0x5A,0), Max(Match.4-0x70,0))
	;----------------------------------------------------------------
	Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , ccd , cc , 2 , 1 )
	Pen := Gdip_CreatePenFromBrush( Brush , 1 )
	Gdip_DeleteBrush( Brush )
	Gdip_DrawRectangle( G , Pen , 50 , 13 , 100 , 24 )
	Gdip_DeletePen( Pen )
	Brush := Gdip_BrushCreateSolid( "0xFF"LineColor )
	Gdip_TextToGraphics( G , "SeizeControl" , "s11 Center vCenter Bold c" Brush " x50 y7" , "Segoe UI" , 100 , 40 )
	Gdip_DeleteBrush( Brush )
	;SeizeControl Text
	/*
    Brush := Gdip_BrushCreateSolid( "0xFF"LineColor  )
	Gdip_TextToGraphics( G , "________________________________________________________________________________________________________________________________________________________________________________________________" , "s10 vCenter Bold c" Brush " x163 y1" , "Segoe UI" , 415 , 40 )
    Gdip_DeleteBrush( Brush )
	*/
	Pen := Gdip_CreatePen( "0xFF"LineColor , 2 )
	Gdip_DrawLine( G , Pen , 165 , 20 , 570 , 20 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF"LineColor , 2 )
	Gdip_DrawLine( G , Pen , 165 , 30 , 570 , 30 )
	Gdip_DeletePen( Pen )
	;TopGuiLine
	Brush := Gdip_BrushCreateSolid( "0xFF"LineColor  )
	Gdip_TextToGraphics( G , "Version "version, "s10 Center vCenter Bold c" Brush " x541 y6" , "Segoe UI" , 150 , 40 )
	Gdip_DeleteBrush( Brush )
	;Version top right
	Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 740 , 427 , "0xFF" LineColor , "0xFF000000" , 1 , 1 )
	Gdip_FillRoundedRectangle( G , Brush , 5 , 55 , 730 , 246 , 15 )
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor )
	Gdip_FillRoundedRectangle( G , Brush , 6 , 56 , 728 , 244 , 15 )
	Gdip_DeleteBrush( Brush )
    Gdip_DeletePen( Pen )
    ;above is big main box
	Gdip_DeleteGraphics( G )
	return pBitmap
}

Create_SubBottom_Window(){
	SBWy := 350-SBWh ;Gui y value
	New Custom_Window( x:= 0 , y = SBWy , w:= 740 , h = SBWh , Name:= "3" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubBottom_Window() )

    HB_Button.Push(New Buttons_1(x:=23, y:=(310-SBWy), w:=108, h:=29, window:="3", Label:="Setting_Window", Text:="Settings", y_Offset:=0 ))
    HB_Button.Push(New Buttons_1(x+=w+0, y, w, h, window:="3", Label:="Control_Window", Text:="Controls", y_Offset:=0))
    HB_Button.Push(New Buttons_1(x:=263, y:=(310-SBWy), w:=108, h:=29, window:="3", Label:="Help_Window", Text:="Help", y_Offset:=0 ))
    HB_Button.Push(New Buttons_1(x+=w+0, y, w, h, window:="3", Label:="About_Window", Text:="About", y_Offset:=0))
	HB_Button.Push(New Buttons_1(x:=503, y:=(310-SBWy), w:=108, h:=29, window:="3", Label:="Reserved_Window", Text:="Reserved", y_Offset:=0 ))
    HB_Button.Push(New Buttons_1(x+=w+0, y, w, h, window:="3", Label:="Reserved_Window", Text:="Reserved", y_Offset:=0 ))

    Gui,3:Color,% BackgroundColor
    Gui,3:Show,% "w740 " "h" SBWh  " y" SBWy "x0"
}
SubBottom_Window(){
	pBitmap:=Gdip_CreateBitmap( 740 , 350 )
	G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 2 )

    Brush := Gdip_BrushCreateSolid("0xFF"BackgroundColor )
	Gdip_FillRectangle( G , Brush , -2 , (-STWh-2) , 746 , 350 )
	Gdip_DeleteBrush( Brush )
	;...
	Brush := Gdip_CreateLineBrushFromRect( 0 , (-SBWy) , 740 , 427 , "0xFF" LineColor , "0xFF000000" , 1 , 1 )
	Gdip_FillRoundedRectangle( G , Brush , 5 , (-SBWy+55) , 730 , 246 , 15 )
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor  )
	Gdip_FillRoundedRectangle( G , Brush , 6 , (-SBWy+56) , 728 , 244 , 15 )
	Gdip_DeleteBrush( Brush )
    Gdip_DeletePen( Pen )
    ;Above is big main box
	Brush := Gdip_CreateLineBrush( 74 , 307 , 99 , 337 , "0xFF" LineColor  , "0xFF000000" , 1 )
	Gdip_FillRoundedRectangle( G , Brush , 15 , (304-SBWy) , 230 , 40 , 15 ) ;y-1
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor  )
	Gdip_FillRoundedRectangle( G , Brush , 16 , (305-SBWy) , 228 , 38 , 15 )
	Gdip_DeleteBrush( Brush )
    ;Bottom box 1
	Brush := Gdip_CreateLineBrush( 419 , 310 , 370 , 329 , "0xFF" LineColor  , "0xFF000000" , 1 ) ;+3
	Gdip_FillRoundedRectangle( G , Brush , 255 , (304-SBWy) , 230 , 40 , 15 ) ;y-1
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor  )
	Gdip_FillRoundedRectangle( G , Brush , 256 , (305-SBWy) , 228 , 38 , 15 )
	Gdip_DeleteBrush( Brush )
    ;Bottom box 2
	Brush := Gdip_CreateLineBrush( 544 , 311 , 557 , 333 , "0xFF" LineColor  , "0xFF000000" , 1 ) ;+1
	Gdip_FillRoundedRectangle( G , Brush , 495 , (304-SBWy) , 230 , 40 , 15 ) ;y-1
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor  )
	Gdip_FillRoundedRectangle( G , Brush , 496 , (305-SBWy) , 228 , 38 , 15 )
	Gdip_DeleteBrush( Brush )
    ;Bottom box 3
    ;Above is 3 small boxes
	Gdip_DeleteGraphics( G )
	return pBitmap
	return pBitmap
}

Create_SubLeft_Window(){
	SLRWh := 350-STWh-SBWh
	New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "4" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubLeft_Window() )

	Gui,4:Color,% BackgroundColor
    Gui,4:Show,% "w" SLWw " h" SLRWh  " y" STWh "x0"
}
SubLeft_Window(){
	pBitmap:=Gdip_CreateBitmap( 740 , 350 )
	G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 2 )

    Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor )
	Gdip_FillRectangle( G , Brush , -2 , (-STWh-2) , 746 , 350 )
	Gdip_DeleteBrush( Brush )
	;...
	Brush := Gdip_CreateLineBrushFromRect( 0 , (-STWh) , 740 , 427 , "0xFF" LineColor , "0xFF000000" , 1 , 1 )
	Gdip_FillRoundedRectangle( G , Brush , 5 , (-STWh+55) , 730 , 246 , 15 )
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor  )
	Gdip_FillRoundedRectangle( G , Brush , 6 , (-STWh+56) , 728 , 244 , 15 )
	Gdip_DeleteBrush( Brush )
	;Above is big main box
    Gdip_DeletePen( Pen )
	Gdip_DeleteGraphics( G )
	return pBitmap
	return pBitmap
}

Create_SubRight_Window(){
	SLRWh := 350-STWh-SBWh
	SRWx :=740-SRWw
	New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "5" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubRight_Window() )

	Gui,5:Color,% BackgroundColor
    Gui,5:Show,% "w" SRWw " h" SLRWh  " y" STWh " x" SRWx
}
SubRight_Window(){
	pBitmap:=Gdip_CreateBitmap( 740 , 350 )
	G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 2 )

    Brush := Gdip_BrushCreateSolid("0xFF"BackgroundColor )
	Gdip_FillRectangle( G , Brush , (-SRWx-2) , (-STWh-2) , 746 , 350 )
	Gdip_DeleteBrush( Brush )
	;...
	Brush := Gdip_CreateLineBrushFromRect( (-SRWx) , (-STWh) , 740 , 427 , "0xFF" LineColor , "0xFF000000" , 1 , 1 )
	Gdip_FillRoundedRectangle( G , Brush , (-SRWx+5) , (-STWh+55) , 730 , 246 , 15 )
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF"BackgroundColor)
	Gdip_FillRoundedRectangle( G , Brush , (-SRWx+6) , (-STWh+56) , 728 , 244 , 15 )
	Gdip_DeleteBrush( Brush )
	;Above is big main box
    Gdip_DeletePen( Pen )
	Gdip_DeleteGraphics( G )
	return pBitmap
	return pBitmap
}

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ Main Sections of the Gui \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;////////////////////////////////////////////////////////////////  Control /////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Create_SubControl_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "SubControl" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubControl_Window() )

	if (CTab = "1")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubControl", label:="ControlTabSelect",Number_Of_tab:=4, Selected_Tab:=1, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	if (CTab = "2")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubControl", label:="ControlTabSelect",Number_Of_tab:=4, Selected_Tab:=2, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	if (CTab = "3")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubControl", label:="ControlTabSelect",Number_Of_tab:=4, Selected_Tab:=3, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	if (CTab = "4")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubControl", label:="ControlTabSelect",Number_Of_tab:=4, Selected_Tab:=4, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")

    Gui,SubControl:Color,% BackgroundColor
	Gui,SubControl:Show,% "w" SSCWw " h" SLRWh  " y" STWh " x" SLWw
}
SubControl_Window(){

}

Create_Control1_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "6" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Control1_Window() )
	Gui,6:Color,cFFFFFF,FFFFFF
	Gui,6:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,6: Add, Text, x0 y0 w200 Center, Fast Window Switch
	Gui,6:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	Gui,6: Add, Text, x0 y20 Section, Hotkey 1:
	if (SHotKeyOnOff1 = "Off"){
		SetHotkey11("6", "55", "19", "SHotkey1", SHotkey1, "SetHotKey1", "SHotKeyOnOff1", "SwitchWinSlot1", "0")
	}else if (SHotKeyOnOff1 = "On"){
		SetHotkey11("6", "55", "19", "SHotkey1", SHotkey1, "SetHotKey1", "SHotKeyOnOff1", "SwitchWinSlot1", "1")
    }
	Gui,6: Add, Text, x0 y50 Section, Slot 1:
	Gui,6: Add, Edit, x40 y48 w135 R1 vS1 Disabled Center, %WinTitle1%
	HB_Button.Push(New Buttons_1(x:=180, y:=45, w:=30, h:=30, window:="6", Label:="GetWindowID", Text:="+", y_Offset:=0 ))
    DRAW_OUTLINE( 6, 0, 80, 220, 5, LineColor, LineColor ,5 )

	Gui,6: Add, Text, x0 y95 Section, Hotkey 2:
	if (SHotKeyOnOff2 = "Off"){
		SetHotkey11("6", "55", "94", "SHotkey2", SHotkey2, "SetHotKey2", "SHotKeyOnOff2", "SwitchWinSlot2", "0")
	}else if (SHotKeyOnOff2 = "On"){
		SetHotkey11("6", "55", "94", "SHotkey2", SHotkey2, "SetHotKey2", "SHotKeyOnOff2", "SwitchWinSlot2", "1")
    }
    Gui,6: Add, Text, x0 y125 Section, Slot 2:
    Gui,6: Add, Edit, x40 y123 w135 R1 vS2 Disabled Center, %WinTitle2%
	HB_Button.Push(New Buttons_1(x:=180, y:=120, w:=30, h:=30, window:="6", Label:="GetWindowID2", Text:="+", y_Offset:=0 ))
	DRAW_OUTLINE( 6, 0, 155, 220, 5, LineColor, LineColor ,5 )

	Gui,6: Add, Text, x0 y170 Section, Hotkey 3:
	if (SHotKeyOnOff3 = "Off"){
		SetHotkey11("6", "55", "169", "SHotkey3", SHotkey3, "SetHotKey3", "SHotKeyOnOff3", "SwitchWinSlot3", "0")
	}else if (SHotKeyOnOff3 = "On"){
		SetHotkey11("6", "55", "169", "SHotkey3", SHotkey3, "SetHotKey3", "SHotKeyOnOff3", "SwitchWinSlot3", "1")
    }
    Gui,6: Add, Text, x0 y200 Section, Slot 3:
    Gui,6: Add, Edit, x40 y198 w135 R1 vS3 Disabled Center, %WinTitle3%
	HB_Button.Push(New Buttons_1(x:=180, y:=195, w:=30, h:=30, window:="6", Label:="GetWindowID3", Text:="+", y_Offset:=0))

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Gui,6:Font,% "c" TextColor " s9"  "Bold " "Underline",% TextFont
	Gui,6: Add, Text, x270 y0 w210 Center, Set Window Transparency
	Gui,6:Font,% "c" TextColor " s9"  "norm",% TextFont

	if (SwitchTabsDefaultHotkey = "Off"){
		New Toggle_Switch_1(x:=270,y:=15,w:=160,Text1:="Default Hotkey Disabled",Text2:="Default Hotkey Enabled", Window:="6", State:=0, Label:="SwitchTabsDefaultHotkey")
	}else if (SwitchTabsDefaultHotkey = "On"){
		New Toggle_Switch_1(x:=270,y:=15,w:=160,Text1:="Default Hotkey Disabled",Text2:="Default Hotkey Enabled", Window:="6", State:=1, Label:="SwitchTabsDefaultHotkey")
    }

	Gui,6:Font,% "c" TextColor " s9"  "Bold",% TextFont
	Gui,6: Add, Text, x270 y35 Section, Custom Hotkeys:
	Gui,6:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,6: Add, Text, x270 y50 Section, Increase opacity:
	if (SetWinTransparencyUpHotkeyOnOff = "Off"){
		SetHotkey11("6", "370", "49", "SetWinTransparencyUpHotkey", SetWinTransparencyUpHotkey, "SetHotkeySetWinTransparencyUp", "SetWinTransparencyUpHotkeyOnOff", "SetWinTransparencyUp", "0")
	}else if (SetWinTransparencyUpHotkeyOnOff = "On"){
		SetHotkey11("6", "370", "49", "SetWinTransparencyUpHotkey", SetWinTransparencyUpHotkey, "SetHotkeySetWinTransparencyUp", "SetWinTransparencyUpHotkeyOnOff", "SetWinTransparencyUp", "1")
    }
	Gui,6: Add, Text, x270 y75 Section, Decrease opacity:
	if (SetWinTransparencyDownHotkeyOnOff = "Off"){
		SetHotkey11("6", "370", "74", "SetWinTransparencyDownHotkey", SetWinTransparencyDownHotkey, "SetHotkeySetWinTransparencyDown", "SetWinTransparencyDownHotkeyOnOff", "SetWinTransparencyDown", "0")
	}else if (SetWinTransparencyDownHotkeyOnOff = "On"){
		SetHotkey11("6", "370", "74", "SetWinTransparencyDownHotkey", SetWinTransparencyDownHotkey, "SetHotkeySetWinTransparencyDown", "SetWinTransparencyDownHotkeyOnOff", "SetWinTransparencyDown", "1")
    }

	Gui,6: Add, Text, x270 y105,Intervals:
	Gui,6: Add, Edit,% " x270 y120 w60 vSetWinTransparencyScalingValue ReadOnly Center R1 c"EditBoxColor, %SetWinTransparencyScalingValue%
	HB_Button.Push(New Buttons_1(x:=335, y:=117, w:=30, h:=30, window:="6", Label:="SetWinTransparencyScalingValue", Text:="Set", y_Offset:=0 ))

	Gui,6: Add, Text, x385 y105,Min-Opacity:
	Gui,6: Add, Edit,% " x385 y120 w60 vSetWinTransparencyMinimumOpacity ReadOnly Center R1 c"EditBoxColor, %SetWinTransparencyMinimumOpacity%
	HB_Button.Push(New Buttons_1(x:=450, y:=117, w:=30, h:=30, window:="6", Label:="SetWinTransparencyMinimumOpacity", Text:="Set", y_Offset:=0 ))
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Gui,6:Font,% "c" TextColor " s9"  "Bold " "Underline",% TextFont
	Gui,6: Add, Text, x270 y175 w210 Center, Toggle AlwaysOnTop
	Gui,6:Font,% "c" TextColor " s9"  "norm",% TextFont

	HB_Button.Push(New Buttons_1(x:=270, y:=195, w:=50, h:=30, window:="6", Label:="SetWindowAlwaysOnTop", Text:="Toggle", y_Offset:=0))
	Gui,6: Add, Text, x320 y202 Section, Window to be AlwaysOnTop

    Gui,6:Color,% BackgroundColor,% BackgroundColor
	Gui,6:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh

}
Control1_Window(){

}

Create_Control2_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "C2" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Control2_Window() )
	Gui,C2:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	HB_Button.Push(New Buttons_1(x:=0, y:=0, w:=60, h:=30, window:="C2", Label:="New_Screen_Clip2", Text:="New Clip", y_Offset:=0 ))

	Gui,C2: Add, Text, x70 y7 Section, Add Hotkey:
	if (SHotKeyOnOff1 = "Off"){
		SetHotkey11("C2", "140", "6", "ScreenClipHotkey1", ScreenClipHotkey1, "SetHotkeyScreenClip1", "ScreenClipHotKeyOnOff", "New_Screen_Clip1", "0")
	}else if (SHotKeyOnOff1 = "On"){
		SetHotkey11("C2", "140", "6", "ScreenClipHotkey1", ScreenClipHotkey1, "SetHotkeyScreenClip1", "ScreenClipHotKeyOnOff", "New_Screen_Clip1", "1")
    }

	Gui,C2: Add, Text, x0 y35 w200, Save location:
	Gui,C2: Add, Edit,% "x0 y50 w200 vScreenShotFilePath ReadOnly Center  R1 c"EditBoxColor, % ScreenShotFilePath
	HB_Button.Push(New Buttons_1(x:=205, y:=47, w:=30, h:=30, window:="C2", Label:="SetScreenShotFilePath", Text:="Set", y_Offset:=0 ))

	if (EnableScreenClipHotkey = "Off"){
		New Toggle_Switch_1(x:=0,y:=75,w:=160,Text1:="Default Hotkey Disabled",Text2:="Default Hotkey Enabled", Window:="C2", State:=0, Label:="EnableScreenClipHotkey")
	}else if (EnableScreenClipHotkey = "On"){
		New Toggle_Switch_1(x:=0,y:=75,w:=160,Text1:="Default Hotkey Disabled",Text2:="Default Hotkey Enabled", Window:="C2", State:=1, Label:="EnableScreenClipHotkey")
    }

	if (EnableScreenClipSave2Clipboard = "Off"){
		New Toggle_Switch_1(x:=0,y:=95,w:=170,Text1:="Copy to Clipboard",Text2:="Copy to Clipboard", Window:="C2", State:=0, Label:="EnableScreenClipSave2Clipboard")
	}else if (EnableScreenClipSave2Clipboard = "On"){
		New Toggle_Switch_1(x:=0,y:=95,w:=170,Text1:="Copy to Clipboard",Text2:="Copy to Clipboard", Window:="C2", State:=1, Label:="EnableScreenClipSave2Clipboard")
    }

	if (EnableScreenClipSave2Folder = "Off"){
		New Toggle_Switch_1(x:=0,y:=115,w:=160,Text1:="Save to Folder",Text2:="Save to Folder", Window:="C2", State:=0, Label:="EnableScreenClipSave2Folder")
	}else if (EnableScreenClipSave2Folder = "On"){
		New Toggle_Switch_1(x:=0,y:=115,w:=160,Text1:="Save to Folder",Text2:="Save to Folder", Window:="C2", State:=1, Label:="EnableScreenClipSave2Folder")
    }

	if (EnableScreenClipOverwrite = "Off"){
		New Toggle_Switch_1(x:=0,y:=135,w:=130,Text1:="Overwrite",Text2:="Overwrite", Window:="C2", State:=0, Label:="EnableScreenClipOverwrite")
	}else if (EnableScreenClipOverwrite = "On"){
		New Toggle_Switch_1(x:=0,y:=135,w:=130,text1:="Overwrite",Text2:="Overwrite", Window:="C2", State:=1, Label:="EnableScreenClipOverwrite")
    }

	if (EnableScreenClipGui_Hide = "Off"){
		New Toggle_Switch_1(x:=0,y:=155,w:=170,Text1:="Hide GUI",Text2:="Hide GUI", Window:="C2", State:=0, Label:="EnableScreenClipGui_Hide")
	}else if (EnableScreenClipShowCloseButton = "On"){
		New Toggle_Switch_1(x:=0,y:=155,w:=170,Text1:="Hide GUI",Text2:="Hide GUI", Window:="C2", State:=1, Label:="EnableScreenClipGui_Hide")
    }


	if (EnableScreenClipShowCloseButton = "Off"){
		New Toggle_Switch_1(x:=160,y:=75,w:=170,Text1:="Show Close Button",Text2:="Show Close Button", Window:="C2", State:=0, Label:="EnableScreenClipShowCloseButton")
	}else if (EnableScreenClipShowCloseButton = "On"){
		New Toggle_Switch_1(x:=160,y:=75,w:=180,Text1:="Show Close Button",Text2:="Show Close Button", Window:="C2", State:=1, Label:="EnableScreenClipShowCloseButton")
    }

	if (EnableScreenClipShow_Picture = "Off"){
		New Toggle_Switch_1(x:=160,y:=95,w:=170,Text1:="Show Clipped Image",Text2:="Show Clipped Image", Window:="C2", State:=0, Label:="EnableScreenClipShow_Picture")
	}else if (EnableScreenClipShow_Picture = "On"){
		New Toggle_Switch_1(x:=160,y:=95,w:=170,Text1:="Show Clipped Image",Text2:="Show Clipped Image", Window:="C2", State:=1, Label:="EnableScreenClipShow_Picture")
    }

	if (EnableScreenClipGui_AlwaysOnTop = "Off"){
		New Toggle_Switch_1(x:=160,y:=115,w:=190,Text1:="Clipped Image +AlwaysOnTop",Text2:="Clipped Image +AlwaysOnTop", Window:="C2", State:=0, Label:="EnableScreenClipGui_AlwaysOnTop")
	}else if (EnableScreenClipGui_AlwaysOnTop = "On"){
		New Toggle_Switch_1(x:=160,y:=115,w:=190,Text1:="Clipped Image +AlwaysOnTop",Text2:="Clipped Image +AlwaysOnTop", Window:="C2", State:=1, Label:="EnableScreenClipGui_AlwaysOnTop")
    }

	if (EnableScreenClipGui_ToolWindow = "Off"){
		New Toggle_Switch_1(x:=160,y:=135,w:=180,Text1:="Clipped Image +ToolWindow",Text2:="Clipped Image +ToolWindow", Window:="C2", State:=0, Label:="EnableScreenClipGui_ToolWindow")
	}else if (EnableScreenClipGui_ToolWindow = "On"){
		New Toggle_Switch_1(x:=160,y:=135,w:=180,Text1:="Clipped Image +ToolWindow",Text2:="Clipped Image +ToolWindow", Window:="C2", State:=1, Label:="EnableScreenClipGui_ToolWindow")
    }

    Gui,C2:Color,% BackgroundColor,% BackgroundColor
	Gui,C2:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh

}
Control2_Window(){

}

Create_Control3_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "C3" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Control3_Window() )
	Gui,C3:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	Gui,C3:Add,Progress,x5 y0 w140 h90 Background222222
	DRAW_OUTLINE("C3", 5 , 0 ,140  , 90 , "444444" , "black" ),DRAW_OUTLINE("C3", 6 , 1 ,138  , 88 , "333333" , "111111" )
    Gui,C3:Add,Progress,x15 y10 w120 h70 BackgroundBlack c%ColorPickerRGBCOLORBLOCK% vColorPickerRGBCOLORBLOCK, 100

	HB_Button.Push(New Buttons_1(x:=2, y:=95, w:=80, h:=30, window:="C3", Label:="Get_Pixel_Color", Text:="GRAB COLOR", y_Offset:=0 ))
	HB_Button.Push(New Buttons_1(x:=82, y:=95, w:=65, h:=30, window:="C3", Label:="ColorPickerCLIPRGB", Text:="CLIP RGB", y_Offset:=0 ))
	HB_Button.Push(New Buttons_1(x:=82, y:=125, w:=65, h:=30, window:="C3", Label:="ColorPickerCLIPHEX", Text:="CLIP HEX", y_Offset:=0 ))

	Gui,C3:Add,Text,x168 y30 w20 h175 vColorPickerREDTRIGGER gColorPickerADJUST_SLIDER
    Gui,C3:Add,Text,x211 y30 w20 h175 vColorPickerGREENTRIGGER gColorPickerADJUST_SLIDER
    Gui,C3:Add,Text,x254 y30 w20 h175 vColorPickerBLUETRIGGER gColorPickerADJUST_SLIDER
	Gui,C3:Add,Progress,x150 y0 w145 h235 Background111111
	DRAW_OUTLINE("C3", 150 , 0 ,145  , 235 , "444444" , "black" ),DRAW_OUTLINE("C3", 151 , 1 ,143  , 233 , "333333" , "111111" )
    Gui,C3:Font,cffffff s10 w600 , Segoe UI
	Gui,C3:Add,Edit,x163 y5 w30 h20 Center -E0x200 ReadOnly vColorPickerREDHEXVALUE ,% ColorPickerREDHEXVALUE
    Gui,C3:Add,Edit,x206 y5 w30 h20 Center -E0x200 ReadOnly vColorPickerGREENHEXVALUE ,% ColorPickerGREENHEXVALUE
    Gui,C3:Add,Edit,x249 y5 w30 h20 Center -E0x200 ReadOnly vColorPickerBLUEHEXVALUE ,% ColorPickerBLUEHEXVALUE
    Gui,C3:Add,Progress,x168 y30 w20 h175 Background330000 caa2222 Range0-255 Vertical vColorPickerREDSLIDERVALUE,% ColorPickerREDSLIDERVALUE
    Gui,C3:Add,Progress,x211 y30 w20 h175 Background003300 c22aa22 Range0-255 Vertical vColorPickerGREENSLIDERVALUE,% ColorPickerGREENSLIDERVALUE
    Gui,C3:Add,Progress,x254 y30 w20 h175 Background000033 c2222aa Range0-255 Vertical vColorPickerBLUESLIDERVALUE,% ColorPickerBLUESLIDERVALUE
    Gui,C3:Add,Edit,x163 y210 w30 h20 Center -E0x200 ReadOnly vColorPickerREDDECVALUE ,% ColorPickerREDDECVALUE
    Gui,C3:Add,Edit,x206 y210 w30 h20 Center -E0x200 ReadOnly vColorPickerGREENDECVALUE ,% ColorPickerGREENDECVALUE
    Gui,C3:Add,Edit,x249 y210 w30 h20 Center -E0x200 ReadOnly vColorPickerBLUEDECVALUE ,% ColorPickerBLUEDECVALUE

	Gui,C3:Add,Progress,x300 y50 w25 h140 Background111111
	Gui,C3:Add,Progress,x525 y50 w25 h140 Background111111
	Gui,C3:Add,Progress,x300 y190 w250 h10 Background111111
	DRAW_OUTLINE("C3", 300 , 0 ,250  , 200 , "444444" , "black" ), DRAW_OUTLINE("C3", 301 , 1 ,248  , 198 , "333333" , "111111" )
    Gui,C3:Font,cdddddd s10 ,Segoe Ui
    Gui,C3:Add,Text,cRed x315 y5 w65 h18 BackgroundTrans Center ,RED
    Gui,C3:Add,Text,cGreen x390 y5 w65 h18 BackgroundTrans Center ,GREEN
    Gui,C3:Add,Text,c0055ff x465 y5 w65 h18 BackgroundTrans Center ,BLUE
    Gui,C3:Add,Edit,x315 y25 w30 h18 -e0x200  Center Number Limit3 vColorPickerREDMIN1 gSUBMIT_C3 , % ColorPickerREDMIN1
    Gui,C3:Add,Edit,x350 y25 w30 h18 -e0x200  Center Number Limit3 vColorPickerREDMAX1 gSUBMIT_C3 , % ColorPickerREDMAX1
    Gui,C3:Add,Edit,x390 y25 w30 h18 -e0x200  Center Number Limit3 vColorPickerGREENMIN1 gSUBMIT_C3 , % ColorPickerGREENMIN1
    Gui,C3:Add,Edit,x425 y25 w30 h18 -e0x200  Center Number Limit3 vColorPickerGREENMAX1  gSUBMIT_C3 , % ColorPickerGREENMAX1
    Gui,C3:Add,Edit,x465 y25 w30 h18 -e0x200  Center Number Limit3 vColorPickerBLUEMIN1 gSUBMIT_C3 , % ColorPickerBLUEMIN1
    Gui,C3:Add,Edit,x505 y25 w30 h18 -e0x200  Center Number Limit3 vColorPickerBLUEMAX1 gSUBMIT_C3 , % ColorPickerBLUEMAX1
	HB_Button.Push(New Buttons_1(x:=380, y:=200, w:=90, h:=30, window:="C3", Label:="ColorPickerRANDOMSETREFRESH", Text:="GENERATE", y_Offset:=0 ))

	Create_Control3a_Window()

    Gui,C3:Color,% BackgroundColor,% BackgroundColor
	Gui,C3:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
SUBMIT_C3(){
	Gui,C3:Submit,NoHide
}
Control3_Window(){
	;Bitmap Created Using: HB Bitmap Maker
	pBitmap:=Gdip_CreateBitmap( 560 , 50 )
	 G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 4 )
	Brush := Gdip_BrushCreateSolid( "0xFF111111" )
	Gdip_FillRectangle( G , Brush , 300 , 0 , 249 , 50 )
	Gdip_DeleteBrush( Brush )
	Gdip_DeleteGraphics( G )
	return pBitmap
}
Create_Control3a_Window(){
    Gui,C3a:Destroy
    Gui,C3a: +ParentC3 -Caption -DPISCALE
    y:=0,tw:=20,th:=tw
    Loop, 7  {
        x:=0
        Loop, 10    {
            RandomColor:=Random_Colour(ColorPickerREDMIN1,ColorPickerREDMAX1,ColorPickerGREENMIN1,ColorPickerGREENMAX1,ColorPickerBLUEMIN1,ColorPickerBLUEMAX1)
			Gui,C3a: Add,Progress,x%x% y%y% w%tw% h%th% Background%RandomColor%
            x+=tw
        }
        y+=th
    }
    Gui,C3a: Show,x325 y50 w200 h140
}

Create_Control4_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "C4" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Control4_Window() )
	Gui,C4:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,C4: Add, Text, x70 y7 Section, It's still being developed. Some reason the code wont work, very annoying.

    Gui,C4:Color,% BackgroundColor,% BackgroundColor
	Gui,C4:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh

}
Control4_Window(){

}
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////// Setting /////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_SubSetting_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "SubSetting" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubSetting_Window() )

	if (STab = "1")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubSetting", label:="SettingTabSelect",Number_Of_tab:=3, Selected_Tab:=1, TabText1:="Appearance", TabText2:="Window", TabText3:="Hotkeys", TabText4:="Reserved", TabText5:="Reserved", TabText6:="")
	if (STab = "2")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubSetting", label:="SettingTabSelect",Number_Of_tab:=3, Selected_Tab:=2, TabText1:="Appearance", TabText2:="Window", TabText3:="Hotkeys", TabText4:="Reserved", TabText5:="Reserved", TabText6:="")
	if (STab = "3")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubSetting", label:="SettingTabSelect",Number_Of_tab:=3, Selected_Tab:=3, TabText1:="Appearance", TabText2:="Window", TabText3:="Hotkeys", TabText4:="Reserved", TabText5:="Reserved", TabText6:="")

	Gui,SubSetting:Color,% BackgroundColor
	Gui,SubSetting:Show,% "w" SSCWw " h" SLRWh  " y" STWh " x" SLWw
}
SubSetting_Window(){

}


Create_Setting1_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S1" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting1_Window() )

	if (STab2 = "1")
		New Horizontal_4Tabs(x:="73", y:="0", window:="S1", label:="SettingTabSelect2",Number_Of_tab:="4", Selected_Tab:="1", TabText1:="Button", TabText2:="Tabs", TabText3:="Toggle", TabText4:="Other")
	if (STab2 = "2")
		New Horizontal_4Tabs(x:="73", y:="0", window:="S1", label:="SettingTabSelect2",Number_Of_tab:="4", Selected_Tab:="2", TabText1:="Button", TabText2:="Tabs", TabText3:="Toggle", TabText4:="Other")
	if (STab2 = "3")
		New Horizontal_4Tabs(x:="73", y:="0", window:="S1", label:="SettingTabSelect2",Number_Of_tab:="4", Selected_Tab:="3", TabText1:="Button", TabText2:="Tabs", TabText3:="Toggle", TabText4:="Other")
	if (STab2 = "4")
		New Horizontal_4Tabs(x:="73", y:="0", window:="S1", label:="SettingTabSelect2",Number_Of_tab:="4", Selected_Tab:="4", TabText1:="Button", TabText2:="Tabs", TabText3:="Toggle", TabText4:="Other")

    Gui,S1:Color,% BackgroundColor
	Gui,S1:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" S1Wh
}
Setting1_Window(){

}

Create_Setting2_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S2" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting2_Window() )
	Gui,S2:Font,% "c" TextColor  " s9 " "norm",% TextFont

	Gui,S2: Add, Text, x5 y5,Color1:
	Gui,S2: Add, Edit,% " x5 y20 w60 vButtonColor2 ReadOnly Center R1 c"EditBoxColor, %ButtonColor2%
	HB_Button.Push(New Buttons_1(x:=70, y:=17, w:=30, h:=30, window:="S2", Label:="ButtonColor2", Text:="Set", y_Offset:=0 ))

	Gui,S2: Add, Text, x5 y55,Color2:
	Gui,S2: Add, Edit,% " x5 y70 w60 vButtonColor3 ReadOnly Center R1 c"EditBoxColor, %ButtonColor3%
	HB_Button.Push(New Buttons_1(x:=70, y:=67, w:=30, h:=30, window:="S2", Label:="ButtonColor3", Text:="Set", y_Offset:=0 ))

	Gui,S2: Add, Text, x5 y105,Background color:
	Gui,S2: Add, Edit,% " x5 y120 w60 vButtonColor ReadOnly Center R1 c"EditBoxColor, %ButtonColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=117, w:=30, h:=30, window:="S2", Label:="ButtonColor", Text:="Set", y_Offset:=0 ))


	Gui,S2: Add, Text, x120 y5,Hover color1:
	Gui,S2: Add, Edit,% " x120 y20 w60 vButtonColor4 ReadOnly Center R1 c"EditBoxColor, %ButtonColor4%
	HB_Button.Push(New Buttons_1(x:=185, y:=17, w:=30, h:=30, window:="S2", Label:="ButtonColor4", Text:="Set", y_Offset:=0))

	Gui,S2: Add, Text, x120 y55,Hover color2:
	Gui,S2: Add, Edit,% " x120 y70 w60 vButtonColor5 ReadOnly Center R1 c"EditBoxColor, %ButtonColor5%
	HB_Button.Push(New Buttons_1(x:=185, y:=67, w:=30, h:=30, window:="S2", Label:="ButtonColor5", Text:="Set", y_Offset:=0))

	Gui,S2: Add, Text, x120 y105,Text Size:
	Gui,S2: Add, Edit,% " x120 y120 w60 vButtonTextSize ReadOnly Center R1 c"EditBoxColor, %ButtonTextSize%
	HB_Button.Push(New Buttons_1(x:=185, y:=117, w:=30, h:=30, window:="S2", Label:="ButtonTextSize", Text:="Set", y_Offset:=0))


	Gui,S2: Add, Text, x235 y5,Pressed color1:
	Gui,S2: Add, Edit,% " x235 y20 w60 vButtonColor6 ReadOnly Center R1 c"EditBoxColor, %ButtonColor6%
	HB_Button.Push(New Buttons_1(x:=300, y:=17, w:=30, h:=30, window:="S2", Label:="ButtonColor6", Text:="Set", y_Offset:=0))

	Gui,S2: Add, Text, x235 y55,Pressed color2:
	Gui,S2: Add, Edit,% " x235 y70 w60 vButtonColor7 ReadOnly Center R1 c"EditBoxColor, %ButtonColor7%
	HB_Button.Push(New Buttons_1(x:=300, y:=67, w:=30, h:=30, window:="S2", Label:="ButtonColor7", Text:="Set", y_Offset:=0))


	Gui,S2: Add, Text, x350 y5,Outline color:
	Gui,S2: Add, Edit,% " x350 y20 w60 vButtonOutline ReadOnly Center R1 c"EditBoxColor, %ButtonOutline%
	HB_Button.Push(New Buttons_1(x:=415, y:=17, w:=30, h:=30, window:="S2", Label:="ButtonOutline", Text:="Set", y_Offset:=0))

	Gui,S2: Add, Text, x350 y55,Outline Hover color:
	Gui,S2: Add, Edit,% " x350 y70 w60 vButtonHoverOutline ReadOnly Center R1 c"EditBoxColor, %ButtonHoverOutline%
	HB_Button.Push(New Buttons_1(x:=415, y:=67, w:=30, h:=30, window:="S2", Label:="ButtonHoverOutline", Text:="Set", y_Offset:=0))


	Gui,S2: Add, Text, x465 y5,Text color top:
	Gui,S2: Add, Edit,% " x465 y20 w60 vButtonTextColorTop  ReadOnly Center R1 c"EditBoxColor, %ButtonTextColorTop%
	HB_Button.Push(New Buttons_1(x:=530, y:=17, w:=30, h:=30, window:="S2", Label:="ButtonTextColorTop", Text:="Set", y_Offset:=0 ))

	Gui,S2: Add, Text, x465 y55,Text color bottom:
	Gui,S2: Add, Edit,% " x465 y70 w60 vButtonTextColorBottom  ReadOnly Center R1 c"EditBoxColor, %ButtonTextColorBottom%
	HB_Button.Push(New Buttons_1(x:=530, y:=67, w:=30, h:=30, window:="S2", Label:="ButtonTextColorBottom", Text:="Set", y_Offset:=0 ))

	Gui,S2: Add, Text, x465 y105,Font:
	Gui,S2: Add, Edit,% " x465 y120 w60 vButtonFont ReadOnly Center R1 c"EditBoxColor, %ButtonFont%
	HB_Button.Push(New Buttons_1(x:=530, y:=117, w:=30, h:=30, window:="S2", Label:="ButtonFont", Text:="Set", y_Offset:=0))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Gui,S2: Add, Text, x5 y180, Input Color as a 6 digit hex code
	Gui,S2: Add, Text, x400 y180, Buttons to default
	HB_Button.Push(New Buttons_1(x:=350, y:=172, w:=50, h:=30, window:="S2", Label:="ResetButtonSettings", Text:="Reset", y_Offset:=0))
	Gui,S2:Color,% BackgroundColor
	Gui,S2:Show,% "x" SCWx " y" (SCWy+S1Wh)  " w" SCWw " h" (SCWh-S1Wh)
}
Setting2_Window(){

}

Create_Setting3_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S3" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting3_Window() )
	Gui,S3:Font,% "c" TextColor  " s9 " "norm",% TextFont

	Gui,S3: Add, Text, x5 y5,Pressed Color:
	Gui,S3: Add, Edit,% " x5 y20 w60 vTabPressedColor ReadOnly Center R1 c"EditBoxColor, %TabPressedColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=17, w:=30, h:=30, window:="S3", Label:="TabPressedColor", Text:="Set", y_Offset:=0 ))

	Gui,S3: Add, Text, x5 y55,Released Color:
	Gui,S3: Add, Edit,% " x5 y70 w60 vTabReleasedColor ReadOnly Center R1 c"EditBoxColor, %TabReleasedColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=67, w:=30, h:=30, window:="S3", Label:="TabReleasedColor", Text:="Set", y_Offset:=0))

	Gui,S3: Add, Text, x5 y105,Background color:
	Gui,S3: Add, Edit,% " x5 y120 w60 vTabColor ReadOnly Center R1 c"EditBoxColor, %TabColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=117, w:=30, h:=30, window:="S3", Label:="TabColor", Text:="Set", y_Offset:=0))


	Gui,S3: Add, Text, x120 y5,Text color:
	Gui,S3: Add, Edit,% " x120 y20 w60 vTabTextColor ReadOnly Center R1 c"EditBoxColor, %TabTextColor%
	HB_Button.Push(New Buttons_1(x:=185, y:=17, w:=30, h:=30, window:="S3", Label:="TabTextColor", Text:="Set", y_Offset:=0 ))

	Gui,S3: Add, Text, x120 y55,Font:
	Gui,S3: Add, Edit,% " x120 y70 w60 vTabFont ReadOnly Center R1 c"EditBoxColor, %TabFont%
	HB_Button.Push(New Buttons_1(x:=185, y:=67, w:=30, h:=30, window:="S3", Label:="TabFont", Text:="Set", y_Offset:=0 ))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Gui,S3: Add, Text, x5 y180, Input Color as a 6 digit hex code
	Gui,S3: Add, Text, x400 y180, Tabs to default
	HB_Button.Push(New Buttons_1(x:=350, y:=172, w:=50, h:=30, window:="S3", Label:="ResetTabsSettings", Text:="Reset", y_Offset:=0))
	Gui,S3:Color,% BackgroundColor
	Gui,S3:Show,% "x" SCWx " y" (SCWy+S1Wh)  " w" SCWw " h" (SCWh-S1Wh)
}
Setting3_Window(){

}

Create_Setting4_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S4" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting4_Window() )
	Gui,S4:Font,% "c" TextColor  " s9 " "norm",% TextFont

	Gui,S4: Add, Text, x5 y5,Enabled color:
	Gui,S4: Add, Edit,% " x5 y20 w60 vToggleEnabledColor ReadOnly Center R1 c"EditBoxColor, %ToggleEnabledColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=17, w:=30, h:=30, window:="S4", Label:="ToggleEnabledColor", Text:="Set", y_Offset:=0))

	Gui,S4: Add, Text, x5 y55,Disabled color:
	Gui,S4: Add, Edit,% " x5 y70 w60 vToggleDisabledColor ReadOnly Center R1 c"EditBoxColor, %ToggleDisabledColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=67, w:=30, h:=30, window:="S4", Label:="ToggleDisabledColor", Text:="Set", y_Offset:=0))

	Gui,S4: Add, Text, x5 y105,Background color:
	Gui,S4: Add, Edit,% " x5 y120 w60 vToggleColor ReadOnly Center R1 c"EditBoxColor, %ToggleColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=117, w:=30, h:=30, window:="S4", Label:="ToggleColor", Text:="Set", y_Offset:=0))


	Gui,S4: Add, Text, x120 y5,Knob color:
	Gui,S4: Add, Edit,% " x120 y20 w60 vToggleKnobColor ReadOnly Center R1 c"EditBoxColor, %ToggleKnobColor%
	HB_Button.Push(New Buttons_1(x:=185, y:=17, w:=30, h:=30, window:="S4", Label:="ToggleKnobColor", Text:="Set", y_Offset:=0))

	Gui,S4: Add, Text, x120 y55,Knob color2:
	Gui,S4: Add, Edit,% " x120 y70 w60 vToggleKnobColor2 ReadOnly Center R1 c"EditBoxColor, %ToggleKnobColor2%
	HB_Button.Push(New Buttons_1(x:=185, y:=67, w:=30, h:=30, window:="S4", Label:="ToggleKnobColor2", Text:="Set", y_Offset:=0))

	Gui,S4: Add, Text, x235 y5,Text color:
	Gui,S4: Add, Edit,% " x235 y20 w60 vToggleTextColor ReadOnly Center R1 c"EditBoxColor, %ToggleTextColor%
	HB_Button.Push(New Buttons_1(x:=300, y:=17, w:=30, h:=30, window:="S4", Label:="ToggleTextColor", Text:="Set", y_Offset:=0))

	Gui,S4: Add, Text, x235 y55,Text size:
	Gui,S4: Add, Edit,% " x235 y70 w60 vToggleTextSize ReadOnly Center R1 c"EditBoxColor, %ToggleTextSize%
	HB_Button.Push(New Buttons_1(x:=300, y:=67, w:=30, h:=30, window:="S4", Label:="ToggleTextSize", Text:="Set", y_Offset:=0))

	Gui,S4: Add, Text, x235 y105,Font:
	Gui,S4: Add, Edit,% " x235 y120 w60 vToggleFont ReadOnly Center R1 c"EditBoxColor, %ToggleFont%
	HB_Button.Push(New Buttons_1(x:=300, y:=117, w:=30, h:=30, window:="S4", Label:="ToggleFont", Text:="Set", y_Offset:=0))
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Gui,S4: Add, Text, x5 y180, Input Color as a 6 digit hex code
	Gui,S4: Add, Text, x400 y180, Toggle to default
	HB_Button.Push(New Buttons_1(x:=350, y:=172, w:=50, h:=30, window:="S4", Label:="ResetToggleSettings", Text:="Reset", y_Offset:=0))
	Gui,S4:Color,% BackgroundColor
	Gui,S4:Show,% "x" SCWx " y" (SCWy+S1Wh)  " w" SCWw " h" (SCWh-S1Wh)
}
Setting4_Window(){

}

Create_Setting5_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S5" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting5_Window() )
	Gui,S5:Font,% "c" TextColor  " s9 " "norm",% TextFont

	Gui,S5: Add, Text, x5 y5,Background color:
	Gui,S5: Add, Edit,% "x5 y20 w60 vBackgroundColor  ReadOnly R1 Center c"EditBoxColor, %BackgroundColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=17, w:=30, h:=30, window:="S5", Label:="BackgroundColor", Text:="Set", y_Offset:=0 ))

	Gui,S5: Add, Text, x5 y55,Lines color:
	Gui,S5: Add, Edit,% " x5 y70 w60 vLineColor ReadOnly Center R1 c"EditBoxColor, %LineColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=67, w:=30, h:=30, window:="S5", Label:="LineColor", Text:="Set", y_Offset:=0 ))

	Gui,S5: Add, Text, x5 y105,Edit box color:
	Gui,S5: Add, Edit,% " x5 y120 w60 vEditBoxColor ReadOnly Center R1 c"EditBoxColor, %EditBoxColor%
	HB_Button.Push(New Buttons_1(x:=70, y:=117, w:=30, h:=30, window:="S5", Label:="EditBoxColor", Text:="Set", y_Offset:=0 ))


	Gui,S5: Add, Text, x120 y5,Text color:
	Gui,S5: Add, Edit,% " x120 y20 w60 vTextColor  ReadOnly Center R1 c"EditBoxColor, %TextColor%
	HB_Button.Push(New Buttons_1(x:=185, y:=17, w:=30, h:=30, window:="S5", Label:="TextColor", Text:="Set", y_Offset:=0))

	Gui,S5: Add, Text, x120 y55,Text font:
	Gui,S5: Add, Edit,% " x120 y70 w60 vTextFont ReadOnly Center R1 c"EditBoxColor, %TextFont%
	HB_Button.Push(New Buttons_1(x:=185, y:=67, w:=30, h:=30, window:="S5", Label:="TextFont", Text:="Set", y_Offset:=0 ))
   	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Gui,S5: Add, Text, x5 y180, Input Color as a 6 digit hex code
	Gui,S5: Add, Text, x400 y180, Other to default
	HB_Button.Push(New Buttons_1(x:=350, y:=172, w:=50, h:=30, window:="S5", Label:="ResetOtherSettings", Text:="Reset", y_Offset:=0))
	Gui,S5:Color,% BackgroundColor
	Gui,S5:Show,% "x" SCWx " y" (SCWy+S1Wh)  " w" SCWw " h" (SCWh-S1Wh)
}
Setting5_Window(){

}


Create_Setting6_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S6" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting6_Window() )

	Gui,S6:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,S6: Add, Text, x0 y0 Center, System Startup Behavior
	Gui,S6:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	Gui,S6: Add, Text, x0 y20, Open on Start Up
	if (OpenOnStartUp = "Off"){
		New Toggle_Switch_1(x:=100,y:=18,w:=30,Text1:="",Text2:="", Window:="S6", State:=0, Label:="OpenOnStartUp")
	}else if (OpenOnStartUp = "On"){
		New Toggle_Switch_1(x:=100,y:=18,w:=30,Text1:="",Text2:="", Window:="S6", State:=1, Label:="OpenOnStartUp")
    }

	Gui,S6: Add, Text, x0 y40, Start Minimized
	if (StartMinimized = "Off"){
		New Toggle_Switch_1(x:=100,y:=38,w:=30,Text1:="",Text2:="", Window:="S6", State:=0, Label:="StartMinimized")
	}else if (StartMinimized = "On"){
		New Toggle_Switch_1(x:=100,y:=38,w:=30,Text1:="",Text2:="", Window:="S6", State:=1, Label:="StartMinimized")
    }

	Gui,S6: Add, Text, x0 y60, Start Compacted
	if (StartCompacted = "Off"){
		New Toggle_Switch_1(x:=100,y:=58,w:=30,Text1:="",Text2:="", Window:="S6", State:=0, Label:="StartCompacted")
	}else if (StartCompacted = "On"){
		New Toggle_Switch_1(x:=100,y:=58,w:=30,Text1:="",Text2:="", Window:="S6", State:=1, Label:="StartCompacted")
    }

	Gui,S6:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,S6: Add, Text, x0 y85 Center, Close Button
	Gui,S6:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	Gui,S6: Add, Text, x0 y105, Minimize to tray
	if (CloseButtonMinimizesToTray = "Off"){
		New Toggle_Switch_1(x:=100,y:=103,w:=30,Text1:="",Text2:="", Window:="S6", State:=0, Label:="CloseButtonMinimizesToTray")
	}else if (CloseButtonMinimizesToTray = "On"){
		New Toggle_Switch_1(x:=100,y:=103,w:=30,Text1:="",Text2:="", Window:="S6", State:=1, Label:="CloseButtonMinimizesToTray")
    }

		Gui,S6:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,S6: Add, Text, x0 y130 Center, Window State
	Gui,S6:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	Gui,S6: Add, Text, x0 y150, AlwaysOnTop
	if (MainWindow_AlwaysOnTop = "Off"){
		New Toggle_Switch_1(x:=100,y:=148,w:=30,Text1:="",Text2:="", Window:="S6", State:=0, Label:="MainWindow_AlwaysOnTop")
	}else if (MainWindow_AlwaysOnTop = "On"){
		New Toggle_Switch_1(x:=100,y:=148,w:=30,Text1:="",Text2:="", Window:="S6", State:=1, Label:="MainWindow_AlwaysOnTop")
    }

	Gui,S6: Add, Text, x0 y170, ToolWindow
	if (MainWindow_ToolWindow = "Off"){
		New Toggle_Switch_1(x:=100,y:=168,w:=30,Text1:="",Text2:="", Window:="S6", State:=0, Label:="MainWindow_ToolWindow")
	}else if (MainWindow_ToolWindow = "On"){
		New Toggle_Switch_1(x:=100,y:=168,w:=30,Text1:="",Text2:="", Window:="S6", State:=1, Label:="MainWindow_ToolWindow")
    }

	Gui,S6:Color,% BackgroundColor
	Gui,S6:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
Setting6_Window(){

}


Create_Setting7_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "S7" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Setting6_Window() )

	Gui,S7:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,S7: Add, Text, x0 y0 Center, Hotkeys
	Gui,S7:Font,% "c" TextColor " s9"  "norm",% ToggleFont

	Gui,S7: Add, Text, x0 y20 Section, CloseApp:
	if (CloseAppHotKeyOnOff = "Off"){
		SetHotkey11("S7", "60", "19", "CloseAppHotkey", CloseAppHotkey, "SetCloseAppHotkey", "CloseAppHotKeyOnOff", "CloseApp", "0")
	}else if (CloseAppHotKeyOnOff = "On"){
		SetHotkey11("S7", "60", "19", "CloseAppHotkey", CloseAppHotkey, "SetCloseAppHotkey", "CloseAppHotKeyOnOff", "CloseApp", "1")
    }

	Gui,S7:Color,% BackgroundColor
	Gui,S7:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
Setting7_Window(){

}

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;/////////////////////////////////////////////////////////////////// Help //////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_SubHelp_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "SubHelp" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubHelp_Window() )

	if (HTab = "1")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubHelp", label:="HelpTabSelect",Number_Of_tab:=4, Selected_Tab:=1, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	if (HTab = "2")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubHelp", label:="HelpTabSelect",Number_Of_tab:=4, Selected_Tab:=2, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	if (HTab = "3")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubHelp", label:="HelpTabSelect",Number_Of_tab:=4, Selected_Tab:=3, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	if (HTab = "4")
		New Vertical_Dark5_Tabs(x:=10, y:=27, window:="SubHelp", label:="HelpTabSelect",Number_Of_tab:=4, Selected_Tab:=4, TabText1:="Window-Tools", TabText2:="Screen-Clipper", TabText3:="Color-Picker", TabText4:="Epic-Pen", TabText5:="", TabText6:="")
	Gui,SubHelp:Color,% BackgroundColor
	Gui,SubHelp:Show,% "w" SSCWw " h" SLRWh  " y" STWh " x" SLWw
}
SubHelp_Window(){

}

Create_Help1_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "H1" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Help1_Window() )
	Gui,H1:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,H1: Add, Text, x0 y0 w235 Center,  Fast Window Switch
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x0 y15, Quickly switch beetween windows with an `nasigned hotkey.

	Gui,H1:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H1: Add, Text, x0 y50, How?
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x0 y65, 1)Click on the WhiteBox to set a hotkey. `n2)Click on "+" to select the window.
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	Gui,H1:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H1: Add, Text, x0 y115 w235 Center, Toggle AlwaysOnTop
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x0 y130, Toggle any window to be AlwaysOnTop or not.

	Gui,H1:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H1: Add, Text, x0 y150, How?
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x0 y165, 1)Click on "Toggle" `n2)Click on window that you wish to toggle.
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Gui,H1:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H1: Add, Text, x270 y0 w235 Center, Set Window Transparency
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x270 y15, Set the opacity of a window.

	Gui,H1:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H1: Add, Text, x270 y35, How?
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x270 y50, 1)Hover over the window you wish to change `n2)Enable the default hotkey then hold `nCTRL+SHIFT+ScrollUp/ScrollDown
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Gui,H1:Font,% "c" TextColor " s9"  "Bold " "Underline",% TextFont
	Gui,H1: Add, Text, x0 y207 w500 Center, Note:
	Gui,H1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H1: Add, Text, x0 y220 w500 Center, Backspace when setting a hotkey to clear it.

    Gui,H1:Color,% BackgroundColor
	Gui,H1:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
Help1_Window(){

}

Create_Help2_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "H2" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Help2_Window() )
	Gui,H2:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H2: Add, Text, x0 y0, Screen Shot
	Gui,H2:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H2: Add, Text, x0 y15, To screen shot press "New Clip" or use the hotkey.

	Gui,H2:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H2: Add, Text, x0 y30, Screen Shot Hotkey
	Gui,H2:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H2: Add, Text, x0 y45, The default hotkey is {Win -> LButton}, this hotkey can be changed.

	Gui,H2:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H2: Add, Text, x0 y60, Hide Gui
	Gui,H2:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H2: Add, Text, x0 y75, You can choose to hide SeizeControl to the traymenu when begining to clip.

	Gui,H2:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H2: Add, Text, x0 y90, Select Area
	Gui,H2:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H2: Add, Text, x0 y105, When selecting an area to clip either click and drag or a single click to clip the hovered window.

	Gui,H2:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H2: Add, Text, x0 y120, Cliped Image Window
	Gui,H2:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H2: Add, Text, x0 y135, Once an area to clip is selected a window of the image apears, it can be closed by the "X" button in the `ntop right corner; the button can be hiden, you can also choose for the window too not apear.

    Gui,H2:Color,% BackgroundColor
	Gui,H2:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
Help2_Window(){

}

Create_Help3_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "H3" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Help3_Window() )
	Gui,H3:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H3: Add, Text, x0 y0, Grab Color
	Gui,H3:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H3: Add, Text, x0 y15, Grab a color anywhere from the screen, press ctrl to save it. Selected color is showed in the display above.

	Gui,H3:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H3: Add, Text, x0 y30, Clip RGB
	Gui,H3:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H3: Add, Text, x0 y45, Saves the hex of color in the display, to the clipboard.

	Gui,H3:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H3: Add, Text, x0 y60, Sliders
	Gui,H3:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H3: Add, Text, x0 y75, Use the sliders to modifie the red, green and blue in the display beside it.

	Gui,H3:Font,% "c" TextColor " s9"  "Bold " "underline",% TextFont
	Gui,H3: Add, Text, x0 y90, Generate Random Colors
	Gui,H3:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H3: Add, Text, x0 y105, Generates 70 random colors which can be saved trough GRAB COLOR. The generated color can be limited `nto a certain amount of red, green and blue.

    Gui,H3:Color,% BackgroundColor
	Gui,H3:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
Help3_Window(){

}

Create_Help4_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "H4" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= Help3_Window() )
	Gui,H4:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,H4: Add, Text, x0 y0 w200, Coming Soon...

    Gui,H4:Color,% BackgroundColor
	Gui,H4:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh
}
Help4_Window(){

}

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;////////////////////////////////////////////////////////////////// About //////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Create_SubAbout_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 740 , h:= 50 , Name:= "SubAbout" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= SubAbout_Window() )

	Gui,SubAbout:Color,% BackgroundColor
	Gui,SubAbout:Show,% "w" SSCWw " h" SLRWh  " y" STWh " x" SLWw
}
SubAbout_Window(){

}

Create_About1_Window(){
	New Custom_Window( x:= 0 , y:= 0 , w:= 200 , h:= 200 , Name:= "A1" , Options:= "-Caption -DPIScale +Parent1" , Title:= "" , Background_Bitmap:= About1_Window() )

    Gui,A1:Font,% "c" TextColor " s9 " "Bold " "underline",% TextFont
	Gui,A1: Add, Text, x0 y5, Version %version%
	Gui,A1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,A1: Add, Text, x0 y20, Currently in the very early stages.

	Gui,A1:Font,% "c" TextColor  " s9 " "Bold " "underline",% TextFont
	Gui,A1: Add, Text, x0 y50, What is this?
	Gui,A1:Font,% "c" TextColor " s9"  "norm",% TextFont
	Gui,A1: Add, Text, x0 y65, SeizeControl is an all in one tool for windows. It features an ability to quickly switch between different windows, take fast screenshots `nthat automatically saves to a folder or your clipboard; saving precious time. Also it can extract the hex of any color displayed on your `nscreen, and it is very portable consisting only of a single file.

    Gui,A1:Color,% BackgroundColor
	Gui,A1:Show,% "x" SCWx " y" SCWy  " w" SCWw " h" SCWh

}
About1_Window(){

}

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ Tray Menu \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Create_Tray_Menu(){
	Menu, Tray, NoStandard
	Menu, Tray, Color,,
	Menu, Tray, Tip, % "SeizeControl_" version
	Menu, Tray, Add, SeizeControl,GuiRestore
	Menu, Tray, Add, Quit, CloseApp
	Menu, Tray, default, SeizeControl
	Menu, Tray, Click, 1
}





;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Switching beetween GUI Windows   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Setting_Window(){
	Gui,S1:destroy
	Gui,S2:destroy
	Gui,S3:destroy
	Gui,S4:destroy
	Gui,S5:destroy
	Gui,S6:destroy
	Gui,S7:destroy

	Gui,SubControl:destroy
    Gui,6:destroy
	Gui,C2:destroy
	Gui,C3:destroy
	Gui,C4:destroy

	Gui,SubHelp:destroy
    Gui,H1:destroy
	Gui,H2:destroy
	Gui,H3:destroy
	Gui,H4:destroy

	Gui,SubAbout:destroy
    Gui,A1:destroy
	SCWx = 170
	GUI_Placement_Calculation()
	Create_SubSetting_Window() ;Gui SubSeting

	if (STab = "1"){
		Create_Setting1_Window() ;Gui S1
		if (STab2 = "1")
			Create_Setting2_Window() ;Gui S2
		if (STab2 = "2")
			Create_Setting3_Window() ;Gui S3
		if (STab2 = "3")
			Create_Setting4_Window() ;Gui S4
		if (STab2 = "4")
			Create_Setting5_Window() ;Gui S5
	}
	if (STab = "2")
		Create_Setting6_Window() ;Gui S6
	if (STab = "3")
		Create_Setting7_Window() ;Gui S7
}

Control_Window(){
    Gui,SubSetting:destroy
    Gui,S1:destroy
	Gui,S2:destroy
	Gui,S3:destroy
	Gui,S4:destroy
	Gui,S5:destroy
	Gui,S6:destroy
	Gui,S7:destroy

	Gui,6:destroy
	Gui,C2:destroy
	Gui,C3:destroy
	Gui,C4:destroy

	Gui,SubHelp:destroy
    Gui,H1:destroy
	Gui,H2:destroy
	Gui,H3:destroy
	Gui,H4:destroy

	Gui,SubAbout:destroy
    Gui,A1:destroy
	SCWx = 175
	GUI_Placement_Calculation()
	Create_SubControl_Window() ;Gui SubControl
	if (CTab = "1")
		Create_Control1_Window() ;Gui 6
	if (CTab = "2")
		Create_Control2_Window() ;Gui C2
	if (CTab = "3")
		Create_Control3_Window() ;Gui C3
	if (CTab = "4")
		Create_Control4_Window() ;Gui C4
}

Help_Window(){
    Gui,SubSetting:destroy
    Gui,S1:destroy
	Gui,S2:destroy
	Gui,S3:destroy
	Gui,S4:destroy
	Gui,S5:destroy
	Gui,S6:destroy
	Gui,S7:destroy

	Gui,SubControl:destroy
    Gui,6:destroy
	Gui,C2:destroy
	Gui,C3:destroy
	Gui,C4:destroy

	Gui,H1:destroy
	Gui,H2:destroy
	Gui,H3:destroy
	Gui,H4:destroy

	Gui,SubAbout:destroy
    Gui,A1:destroy
	SCWx = 170
	GUI_Placement_Calculation()
	Create_SubHelp_Window() ;Gui SubHelp
	if (HTab = "1")
		Create_Help1_Window() ;Gui H1
	if (HTab = "2")
		Create_Help2_Window() ;Gui H2
	if (HTab = "3")
		Create_Help3_Window() ;Gui H3
}

About_Window(){
    Gui,SubSetting:destroy
    Gui,S1:destroy
	Gui,S2:destroy
	Gui,S3:destroy
	Gui,S4:destroy
	Gui,S5:destroy
	Gui,S6:destroy
	Gui,S7:destroy

	Gui,SubControl:destroy
    Gui,6:destroy
	Gui,C2:destroy
	Gui,C3:destroy
	Gui,C4:destroy

	Gui,SubHelp:destroy
    Gui,H1:destroy
	Gui,H2:destroy
	Gui,H3:destroy
	Gui,H4:destroy

	SCWx = 11
	GUI_Placement_Calculation()
	Create_SubAbout_Window() ;Gui SubAbout
    Create_About1_Window() ;Gui A1
}

Reserved_Window(){
	Gui,SubSetting:destroy
    Gui,S1:destroy
	Gui,S2:destroy
	Gui,S3:destroy
	Gui,S4:destroy
	Gui,S5:destroy
	Gui,S6:destroy
	Gui,S7:destroy

	Gui,SubControl:destroy
    Gui,6:destroy
	Gui,C2:destroy
	Gui,C3:destroy
	Gui,C4:destroy

	Gui,SubHelp:destroy
    Gui,H1:destroy
	Gui,H2:destroy
	Gui,H3:destroy

	Gui,SubAbout:destroy
    Gui,A1:destroy
}
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SettingTabSelect(){
	if (VD5Tab = "1"){
	    Gui,S3:destroy
	    Gui,S4:destroy
	    Gui,S5:destroy
		Gui,S6:destroy
		Gui,S7:destroy
		Create_Setting1_Window()
		if (STab2 = "1")
			Create_Setting2_Window() ;Gui S2
		if (STab2 = "2")
			Create_Setting3_Window() ;Gui S3
		if (STab2 = "3")
			Create_Setting4_Window() ;Gui S4
		if (STab2 = "4")
			Create_Setting5_Window() ;Gui S5
		STab = 1
	    return
    }
	if (VD5Tab = "2"){
	    Gui,S1:destroy
		Gui,S2:destroy
	    Gui,S3:destroy
	    Gui,S4:destroy
	    Gui,S5:destroy
		Gui,S7:destroy
		Create_Setting6_Window()
		STab = 2
	    return
    }
    if (VD5Tab = "3"){
	    Gui,S1:destroy
		Gui,S2:destroy
		Gui,S3:destroy
		Gui,S4:destroy
		Gui,S5:destroy
		Gui,S6:destroy
		Create_Setting7_Window()
		STab = 3
	    return
    }
    if (VD5Tab = "4"){
	    Gui,S1:destroy
		Gui,S2:destroy
		Gui,S3:destroy
		Gui,S4:destroy
		Gui,S5:destroy
		Gui,S6:destroy
		Gui,S7:destroy
		STab = 4
	    return
    }
    if (VD5Tab = "5"){
	    Gui,S1:destroy
		Gui,S2:destroy
		Gui,S3:destroy
		Gui,S4:destroy
		Gui,S5:destroy
		Gui,S6:destroy
		Gui,S7:destroy
		STab = 5
	    return
    }
}
SettingTabSelect2(){
	if (H4Tab = "1"){
		Gui,S3:destroy
		Gui,S4:destroy
		Gui,S5:destroy
		Create_Setting2_Window()
		STab2 = 1
	    return
    }
	if (H4Tab = "2"){
	    Gui,S2:destroy
		Gui,S4:destroy
		Gui,S5:destroy
		Create_Setting3_Window()
		STab2 = 2
	    return
    }
    if (H4Tab = "3"){
	    Gui,S2:destroy
		Gui,S3:destroy
		Gui,S5:destroy
		Create_Setting4_Window()
		STab2 = 3
	    return
    }
    if (H4Tab = "4"){
	    Gui,S2:destroy
		Gui,S3:destroy
		Gui,S4:destroy
		Create_Setting5_Window()
		STab2 = 4
	    return
    }
}
ControlTabSelect(){
	if (VD5Tab = "1"){
		Gui,C2:destroy
		Gui,C3:destroy
		Gui,C4:destroy
		Create_Control1_Window()
		CTab = 1
	    return
    }
	if (VD5Tab = "2"){
	    Gui,6:destroy
		Gui,C3:destroy
		Gui,C4:destroy
		Create_Control2_Window()
		CTab = 2
	    return
    }
    if (VD5Tab = "3"){
	    Gui,6:destroy
		Gui,C2:destroy
		Gui,C4:destroy
		Create_Control3_Window()
		CTab = 3
	    return
    }
    if (VD5Tab = "4"){
	    Gui,6:destroy
		Gui,C2:destroy
		Gui,C3:destroy
		Create_Control4_Window()
		CTab = 4
	    return
    }
    if (VD5Tab = "5"){
	    Gui,6:destroy
		Gui,C2:destroy
		Gui,C3:destroy
		Gui,C4:destroy
		CTab = 5
	    return
    }
}
HelpTabSelect(){
	if (VD5Tab = "1"){
		Gui,H2:destroy
		Gui,H3:destroy
		Create_Help1_Window()
		HTab = 1
	    return
    }
	if (VD5Tab = "2"){
	    Gui,H1:destroy
		Gui,H3:destroy
		Gui,H4:destroy
		Create_Help2_Window()
		HTab = 2
	    return
    }
    if (VD5Tab = "3"){
	    Gui,H1:destroy
		Gui,H2:destroy
		Gui,H4:destroy
		Create_Help3_Window()
		HTab = 3
	    return
    }
    if (VD5Tab = "4"){
	    Gui,H1:destroy
		Gui,H2:destroy
		Gui,H3:destroy
		Create_Help4_Window()
		HTab = 4
	    return
    }
    if (VD5Tab = "5"){
	    Gui,H1:destroy
		Gui,H2:destroy
		Gui,H3:destroy
		Gui,H4:destroy
		HTab = 5
	    return
    }
}


;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Gui Show, Hide, Minimize, Maximise, Size-Change, Move, Close   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GuiHide(){
	Gui,1:Hide
	SeizeControl_Gui_Status = Hide
}
GuiRestore(){
	Gui,1:Show
    WinShow
    WinRestore
	SeizeControl_Gui_Status = Show
}
Move_Window(){
	SetTimer,HB_Button_Hover,Off
	Gui, 1:+LastFound
	PostMessage,0xA1,2
	While(GetKeyState("LButton"))
		sleep 20
	SetTimer,HB_Button_Hover,On
}
MoveActiveWindow(){
	PostMessage, 0xA1 , 2  ;Move the active window
}

GuiClose(){
	Gui,1:Show, Minimize
}
GuiEscape(){
	Gui,1:Show, Minimize
	SeizeControl_Gui_Status = Minimize
}
GuiMinimize(){
	Gui,1:Show, Minimize
	SeizeControl_Gui_Status = Minimize
}
CloseApp(){
	IniWrite_All_Variable_Values()
	ExitApp
}
EmptyLabel(){
}
GuiContextMenu:
	if(TogWinTab:=!TogWinTab)
        {
			ContextMenu = 1
			Create_Main_Window()
        }
        else
        {
			ContextMenu = 0
			Create_Main_Window()
			if (asbuh = 1){
			} else {
				Create_SubTop_Window()
				asbuh = 1
			}
        }
return





;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Window Tools   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;========================================================== Switch Windows ================================================================
;--------------------------------------------------------------- Slot 1 --------------------------------------------------------------------
SwitchWinSlot1(){
	SetTimer,ToolTipFollowMouse, On
    WinGetTitle, WinTitle1, ahk_id %ID1%
    WinName = %WinTitle1%
	ToolTip, Switched to [ %WinName% ]
	WinActivate, ahk_id %ID1%
    SetTimer,SwitchWindow_SetTransparency_EndToolTip,-1500
}
GetWindowID(){
	SetTimer,ToolTipFollowMouse, On
	ToolTip, Click on the window
	KeyWait, Lbutton, Down
	sleep, 100
	ID1 := WinExist("A")
	WinGetTitle, WinTitle1, ahk_id %ID1%
	WinName = %WinTitle1%
	ToolTip, Saved [ %WinName% ] to Slot 1
	GuiControl,,S1, % WinTitle1
	Sleep, 500
	Gui,1:Show
	SetTimer,SwitchWindow_SetTransparency_EndToolTip,-1000
}
SetHotkey1(){
	SetHotkey33("6","SHotkey1",SHotkey1,SetHotkey22("6","SHotkey1",SHotkey1,"SwitchWinSlot1"),"SwitchWinSlot1",SHotKeyOnOff1)
}
SHotKeyOnOff1(){
	if(SHotKeyOnOff1 = "Off"){
		SHotKeyOnOff1 = On
		if Not (SHotkey1 = None)
			Hotkey, % SHotkey1 , SwitchWinSlot1 , On
	}else if(SHotKeyOnOff1 = "On"){
		SHotKeyOnOff1 = Off
		if Not (SHotkey1 = None)
			Hotkey, % SHotkey1 , SwitchWinSlot1 , Off
	}
	IniWrite_All_Variable_Values()
}
;--------------------------------------------------------------- Slot 2 --------------------------------------------------------------------
SwitchWinSlot2(){
	SetTimer,ToolTipFollowMouse, On
    WinGetTitle, WinTitle2, ahk_id %ID2%
	WinName = %WinTitle2%
	ToolTip, Switched to [ %WinName% ]
	WinActivate, ahk_id %ID2%
    SetTimer,SwitchWindow_SetTransparency_EndToolTip,-1500
}
GetWindowID2(){
	SetTimer,ToolTipFollowMouse, On
	ToolTip, Click on the window
	KeyWait, Lbutton, Down
	sleep, 100
	ID2 := WinExist("A")
	WinGetTitle, WinTitle2, ahk_id %ID2%
	WinName = %WinTitle2%
    ToolTip, Saved [ %WinName% ] to Slot 2
	GuiControl,,S2, % WinTitle2
	Sleep, 500
	Gui,1:Show
	SetTimer,SwitchWindow_SetTransparency_EndToolTip,-1000
}
SetHotkey2(){
	SetHotkey33("6","SHotkey2",SHotkey2,SetHotkey22("6","SHotkey2",SHotkey2,"SwitchWinSlot2"),"SwitchWinSlot2",SHotKeyOnOff2)
}
SHotKeyOnOff2(){
	if(SHotKeyOnOff2 = "Off"){
		SHotKeyOnOff2 = On
		if Not (SHotkey2 = None)
			Hotkey, % SHotkey2 , SwitchWinSlot2 , On
	}else if(SHotKeyOnOff2 = "On"){
		SHotKeyOnOff2 = Off
		if Not (SHotkey2 = None)
			Hotkey, % SHotkey2 , SwitchWinSlot2 , Off
	}
	IniWrite_All_Variable_Values()
}
;--------------------------------------------------------------- Slot 3 --------------------------------------------------------------------
SwitchWinSlot3(){
	SetTimer,ToolTipFollowMouse, On
    WinGetTitle, WinTitle3, ahk_id %ID3%
	WinName = %WinTitle3%
	ToolTip, Switched to [ %WinName% ]
	WinActivate, ahk_id %ID3%
    SetTimer,SwitchWindow_SetTransparency_EndToolTip,-1500
}
GetWindowID3(){
	SetTimer,ToolTipFollowMouse, On
	ToolTip, Click on the window
	KeyWait, Lbutton, Down
	sleep, 100
	ID3 := WinExist("A")
	WinGetTitle, WinTitle3, ahk_id %ID3%
	WinName = %WinTitle3%
	ToolTip, Saved [ %WinName% ] to Slot 3
	GuiControl,,S3, % WinTitle3
	Sleep, 500
	Gui,1:Show
	SetTimer,SwitchWindow_SetTransparency_EndToolTip,-1000
}
SetHotkey3(){
	SetHotkey33("6","SHotkey3",SHotkey3,SetHotkey22("6","SHotkey3",SHotkey3,"SwitchWinSlot3"),"SwitchWinSlot3",SHotKeyOnOff3)
}
SHotKeyOnOff3(){
	if(SHotKeyOnOff3 = "Off"){
		SHotKeyOnOff3 = On
		if Not (SHotkey3 = None)
			Hotkey, % SHotkey3 , SwitchWinSlot3 , On
	}else if(SHotKeyOnOff3 = "On"){
		SHotKeyOnOff3 = Off
	    if Not (SHotkey3 = None)
			Hotkey, % SHotkey3 , SwitchWinSlot3 , Off
	}
	IniWrite_All_Variable_Values()
}

SwitchWindow_SetTransparency_EndToolTip(){
	ToolTip
	SetTimer,ToolTipFollowMouse,Off
}
;========================================================= SetTransparency =================================================================
#If (SwitchTabsDefaultHotkey = "On")
^+WheelUp:: SetWinTransparencyUp()
^+WheelDown:: SetWinTransparencyDown()
#If
SetWinTransparencyUp(){
	SetWinTransparencyScalingValue := round(sqrt(SetWinTransparencyScalingValue * SetWinTransparencyScalingValue))
	SetWinTransparency()
}
SetWinTransparencyDown(){
	SetWinTransparencyScalingValue :=  -1 * round(sqrt(SetWinTransparencyScalingValue * SetWinTransparencyScalingValue))
	SetWinTransparency()
}

SetWinTransparency(){
    WinGet, WinID, ID, A
    WinGetClass, WinClass, A
    WinGet, Trans, Transparent, ahk_id %WinID%

    ; Don't make Transparent those special Windows
    if(WinID = "" || WinClass = "Progman" || WinClass = "Shell_TrayWnd" || WinClass = "WorkerW" || WinClass = "MsgrIMEWindowClass")
        return

    ; Set Transparency On
    if(Trans = "")
        Trans := "255"

    ; Set Transparency Level
	Trans := (Trans + SetWinTransparencyScalingValue)

	;Minimum Transparency Level
	if (Trans < SetWinTransparencyMinimumOpacity)
		Trans := SetWinTransparencyMinimumOpacity

    if(Trans >= 255)
        Trans := "Off"
    SetTimer,ToolTipFollowMouse, On
    ToolTip, % "Transparency: " Trans
    SetTimer, SwitchWindow_SetTransparency_EndToolTip, -1000
    WinSet, Transparent, %Trans%, ahk_id %WinID%
}


SwitchTabsDefaultHotkey(){
	if(SwitchTabsDefaultHotkey = "Off"){
		SwitchTabsDefaultHotkey = On
	} else if(SwitchTabsDefaultHotkey = "On"){
		SwitchTabsDefaultHotkey = Off
	}
	IniWrite_All_Variable_Values()
}

SetHotkeySetWinTransparencyUp(){
	SetHotkey33("6","SetWinTransparencyUpHotkey",SetWinTransparencyUpHotkey,SetHotkey22("6","SetWinTransparencyUpHotkey",SetWinTransparencyUpHotkey,"SetWinTransparencyUp"),"SetWinTransparencyUp",SetWinTransparencyHotkeyOnOff)
}
SetHotkeySetWinTransparencyDown(){
	SetHotkey33("6","SetWinTransparencyDownHotkey",SetWinTransparencyDownHotkey,SetHotkey22("6","SetWinTransparencyDownHotkey",SetWinTransparencyDownHotkey,"SetWinTransparencyDown"),"SetWinTransparencyDown",SetWinTransparencyHotkeyOnOff)
}
SetWinTransparencyUpHotkeyOnOff(){
	if(SetWinTransparencyUpHotkeyOnOff = "Off"){
		SetWinTransparencyUpHotkeyOnOff = On
		if Not (SetWinTransparencyUpHotkey = None)
			Hotkey, % SetWinTransparencyUpHotkey , SetWinTransparencyUp , On
	}else if(SetWinTransparencyUpHotkeyOnOff = "On"){
		SetWinTransparencyUpHotkeyOnOff = Off
	    if Not (SetWinTransparencyUpHotkey = None)
			Hotkey, % SetWinTransparencyUpHotkey , SetWinTransparencyUp , Off
	}
	IniWrite_All_Variable_Values()
}
SetWinTransparencyDownHotkeyOnOff(){
	if(SetWinTransparencyDownHotkeyOnOff = "Off"){
		SetWinTransparencyDownHotkeyOnOff = On
		if Not (SetWinTransparencyDownHotkey = None)
			Hotkey, % SetWinTransparencyDownHotkey , SetWinTransparencyDown , On
	}else if(SetWinTransparencyDownHotkeyOnOff = "On"){
		SetWinTransparencyDownHotkeyOnOff = Off
		if Not (SetWinTransparencyDownHotkey = None)
			Hotkey, % SetWinTransparencyDownHotkey , SetWinTransparencyDown , Off
	}
	IniWrite_All_Variable_Values()
}

SetWinTransparencyScalingValue(){
	EditBoxSetValue("6","SetWinTransparencyScalingValue","Create_Control1_Window")
}
SetWinTransparencyMinimumOpacity(){
	EditBoxSetValue("6","SetWinTransparencyMinimumOpacity","Create_Control1_Window")
}
;=================================================== Toggle Window AlwaysOnTop ============================================================
SetWindowAlwaysOnTop(){
	SetTimer,ToolTipFollowMouse, On
	ToolTip, Click on the Window
	KeyWait, Lbutton, Down
	WinGetTitle, activeWindow, A
	if IsWindowAlwaysOnTop(activeWindow) {
		ToolTip:= "The window """ . activeWindow . """ is now always on top."
	}
	else {
		ToolTip:= "The window """ . activeWindow . """ is no longer always on top."
	}
	Winset, Alwaysontop, , A
	ToolTip, % ToolTip
	Sleep, 1500
	ToolTip,
	SetTimer,ToolTipFollowMouse, Off
}
IsWindowAlwaysOnTop(windowTitle) {
	WinGet, windowStyle, ExStyle, %windowTitle%
	isWindowAlwaysOnTop := if (windowStyle & 0x8) ? false : true ; 0x8 is WS_EX_TOPMOST.
	return isWindowAlwaysOnTop
}


;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Screen Clipper   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------------------------------- Trigger -----------------------------------------------------------------
New_Screen_Clip1:
#If (EnableScreenClipHotkey = "On")
#Lbutton::
gosub, New_Screen_Clip3
#if
return
New_Screen_Clip3:
Start_ScreenCliping(EnableScreenClipSave2Clipboard, EnableScreenClipSave2Folder, ScreenShotFilePath, EnableScreenClipOverwrite, EnableScreenClipShowCloseButton, EnableScreenClipShow_Picture, EnableScreenClipGui_Hide, EnableScreenClipGui_AlwaysOnTop, EnableScreenClipGui_ToolWindow)
return
;------------------------------------------------------------- Functionality --------------------------------------------------------------
Start_ScreenCliping(Clip, Save, Save_Location, Overwrite, Close_Button, Show_Picture, Gui_Hide, Gui_AlwaysOnTop, Gui_ToolWindow){
	While GetKeyState("LButton","P") ;Waits till LButton is up
		Sleep, 10
	Hotkey, LButton, EmptyLabel, On ;Prevent LButton from trigering anything

	Gui,SCTw:+AlwaysOnTop -Caption -DPIScale +LastFound +ToolWindow
	Gui,SCTw:Color,00FF00
	WinSet,Transparent,75
	Gui,SCTw:Show,% "x0 y0" " w" A_ScreenWidth " h" A_ScreenHeight ,

	ScreenClipIndex++ ;Increment the current index. (the gui's name)
	if (Gui_AlwaysOnTop = "On" and Gui_ToolWindow = "On")
		Gui, % "ScreenClip" ScreenClipIndex ":New", +AlwaysOnTop -Caption -DPIScale +ToolWindow +LastFound +Border hwndHwnd
		else if (Gui_AlwaysOnTop = "On")
			Gui, % "ScreenClip" ScreenClipIndex ":New", +AlwaysOnTop -Caption -DPIScale +LastFound +Border hwndHwnd
			else if (Gui_ToolWindow = "On")
				Gui, % "ScreenClip" ScreenClipIndex ":New", -Caption -DPIScale +ToolWindow +LastFound +Border hwndHwnd
				else
					Gui, % "ScreenClip" ScreenClipIndex ":New", -Caption -DPIScale +LastFound +Border hwndHwnd


	ScreenClipHandles[hwnd] := ScreenClipIndex  ;Use the windows handle (hwnd) as the index for the the value of the windows name.
	Gui, % "ScreenClip" ScreenClipIndex ":Color", Clear
	WinSet, TransColor , Clear
	Gui, % "ScreenClip" ScreenClipIndex ":Font", cMaroon s10 Bold Q5 , Segoe UI
	Gui_Restore = On
	if (SeizeControl_Gui_Status = "Minimize" or SeizeControl_Gui_Status = "Hide")
		Gui_Restore = Off
	if (Gui_Hide = "On")
		GuiHide()



	While Not GetKeyState("LButton","P"){ ;While LButton is up
		MouseGetPos, x, y, hWin
		hUnder := CoordGetWin(x, y, hWin) ;Exclude hWin to retrieve the next window under it
		hUnderUnder := CoordGetWin2(x, y, hWin, hUnder) ;Exclude hWin and hUnder to retrieve the next window under under it

		WinGetTitle, title, ahk_id %hUnderUnder%
		WinGetPos, WindowX, WindowY, WindowW, WindowH, % "ahk_id " hUnderUnder
		WinPos := { X: WindowX , Y: WindowY , W: WindowW , H: WindowH }

		MouseGetPos, TX, TY
		helptext:="Title: " title "`n"
		helptext.="WinX:" WinPos.X " WinY:" WinPos.Y " Width:" WinPos.W " Hieght:" WinPos.H "`n"
		helptext.="MouseX:" TX " MouseY" TY
		Tooltip, % helptext
		Gui, % "ScreenClip" ScreenClipIndex ":Show", % "x" WinPos.X " y" WinPos.Y " w" WinPos.W " h" WinPos.H " NA"
		sleep 25
	}
	ToolTip,

	MouseGetPos, SX , SY ;Get the x and y starting position.
	While GetKeyState("LButton", "P"){ ;While LButton Down
		MouseGetPos, BX , BY
	    if Not (BX = SX and BY = SY){
			Break
		}
	}
	If GetKeyState("LButton","P"){ ;If LButton is still down
		Gui, % "ScreenClip" ScreenClipIndex ":Color", Clear
		WinSet, TransColor , Clear
		Gui,SCTw:Destroy ;Destroy green window
		;Start selecting Screen Shot Area
		While GetKeyState("LButton", "P"){ ;While LButton is down
			MouseGetPos, EX , EY ;Get the current position of the cursor.
		    if( SX <= EX && SY <= EY )  ;bottom right
				WinPos := { X: SX , Y: SY , W: EX - SX , H: EY - SY }
			else if( SX > EX && SY <= EY ) ;bottom left
				WinPos := { X: EX , Y: SY , W: SX - EX , H: EY - SY }
			else if( SX <= EX && SY > EY ) ;Top right
				WinPos := { X: SX , Y: EY , W: EX - SX , H: SY - EY }
			else if( SX > EX && SY > EY ) ;Top left
				WinPos := { X: EX , Y: EY , W: SX - EX , H: SY - EY }
			Gui, % "ScreenClip" ScreenClipIndex ":Show", % "x" WinPos.X " y" WinPos.Y " w" WinPos.W " h" WinPos.H " NA"

			MouseGetPos, TX, TY
			helptext:=" Width:" WinPos.W " Hieght:" WinPos.H "`n"
			helptext.="MouseX:" TX " MouseY" TY
			Tooltip, % helptext
			sleep 25
		}
    }
	Tooltip,
	Gui,SCTw:Destroy ;Destroy green window
	Hotkey, LButton, EmptyLabel, Off


	;Selecting Screen shot area finsished
	if( WinPos.W < 10 || WinPos.H < 10 ) { ; if the cap area width or height is less than 10px.
		Gui, % "ScreenClip" ScreenClipIndex ":Destroy"
		if (Gui_Restore = "On")
			GuiRestore()
		return
	}
	Gui, % "ScreenClip" ScreenClipIndex ":-Border"
	ClipBitmap := Gdip_BitmapFromScreenModified( WinPos.X, WinPos.Y, WinPos.W, WinPos.H)
	;ClipBitmap := Gdip_BitmapFromScreen( WinPos.X "|" WinPos.Y "|" WinPos.W "|" WinPos.H ) ;Not used using above since orignal not working.
	if (Gui_Restore = "On")
		GuiRestore()

	if (Clip = "On")
		Gdip_SetBitmapToClipboard(ClipBitmap)

	if (Save="On"){
		if (Overwrite="Off")
			if FileExist(Save_Location ".png")
				ClipName := Save_Location " " A_Now
			else
				ClipName := Save_Location
		if (Overwrite="On")
			ClipName := Save_Location
		Gdip_SaveBitmapToFile( ClipBitmap , ClipName ".png" , 100)
    }
	Gui, % "ScreenClip" ScreenClipIndex ":+Border" +LastFound

	if (Close_Button = "Off"){
		Gui, % "ScreenClip" ScreenClipIndex ":Add", Text , % "x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" ,
	} else {
	    Gui, % "ScreenClip" ScreenClipIndex ":Add", Text , % "Center 0x200 Border x" WinPos.W - 20 " y0 w20 h20 BackgroundTrans gCloseClip" , X
	}

	Gui, % "ScreenClip" ScreenClipIndex ":Add", Text , % "x0 y0 w" WinPos.W " h" WinPos.H " BackgroundTrans gMoveActiveWindow"

	Screen_Clip_Bitmap:=Gdip_CreateHBITMAPFromBitmap(ClipBitmap)
	Gdip_DisposeImage(ClipBitmap) ;Dispose of the bitmap to free memory.
	Gui, % "ScreenClip" ScreenClipIndex ":Add",Picture, % "x0 y0 w" WinPos.W " h" WinPos.H " 0xE hwndhwnd"
	if (Show_Picture = "Off"){
		Gui, % "ScreenClip" ScreenClipIndex ":Destroy"
	}
	Background_Hwnd:=hwnd
	SetImage(Background_Hwnd,Screen_Clip_Bitmap)

	WinSet, TransColor , Off
}
CloseClip(){
	hwnd := WinActive() ;Get the handle to the active window
	Gui, % "ScreenClip" ScreenClipHandles[hwnd] ": Destroy"  ;Destroy the gui with the name stored in the Handles array at position hwnd.
}
;---------------------------------------------------------------- Settings ----------------------------------------------------------------
SetScreenShotFilePath(){
	GUI,C2:Submit, NoHide
	FileSelectFile, ScreenShotFilePath, S, Saved Clip, Save as,
	Gui,C2:destroy
	Func("Create_Control2_Window").Bind(PARAMETER).Call()
 }
EnableScreenClipHotkey(){
	if(EnableScreenClipHotkey = "Off"){
		EnableScreenClipHotkey = On
	} else if(EnableScreenClipHotkey = "On"){
		EnableScreenClipHotkey = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipSave2Clipboard(){
	if(EnableScreenClipSave2Clipboard = "Off"){
		EnableScreenClipSave2Clipboard = On
	}else if(EnableScreenClipSave2Clipboard = "On"){
		EnableScreenClipSave2Clipboard = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipSave2Folder(){
	if(EnableScreenClipSave2Folder = "Off"){
		EnableScreenClipSave2Folder = On
	}else if(EnableScreenClipSave2Folder = "On"){
		EnableScreenClipSave2Folder = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipOverwrite(){
	if(EnableScreenClipOverwrite = "Off"){
		EnableScreenClipOverwrite = On
	}else if(EnableScreenClipOverwrite = "On"){
		EnableScreenClipOverwrite = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipGui_Hide(){
	if(EnableScreenClipGui_Hide = "Off"){
		EnableScreenClipGui_Hide = On
	}else if(EnableScreenClipGui_Hide = "On"){
		EnableScreenClipGui_Hide = Off
	}
	IniWrite_All_Variable_Values()
}

EnableScreenClipShowCloseButton(){
	if(EnableScreenClipShowCloseButton = "Off"){
		EnableScreenClipShowCloseButton = On
	}else if(EnableScreenClipShowCloseButton = "On"){
		EnableScreenClipShowCloseButton = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipShow_Picture(){
	if(EnableScreenClipShow_Picture = "Off"){
		EnableScreenClipShow_Picture = On
	}else if(EnableScreenClipShow_Picture = "On"){
		EnableScreenClipShow_Picture = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipGui_AlwaysOnTop(){
	if(EnableScreenClipGui_AlwaysOnTop = "Off"){
		EnableScreenClipGui_AlwaysOnTop = On
	}else if(EnableScreenClipGui_AlwaysOnTop = "On"){
		EnableScreenClipGui_AlwaysOnTop = Off
	}
	IniWrite_All_Variable_Values()
}
EnableScreenClipGui_ToolWindow(){
	if(EnableScreenClipGui_ToolWindow = "Off"){
		EnableScreenClipGui_ToolWindow = On
	}else if(EnableScreenClipGui_ToolWindow = "On"){
		EnableScreenClipGui_ToolWindow = Off
	}
	IniWrite_All_Variable_Values()
}

SetHotkeyScreenClip1(){
	SetHotkey33("C2","ScreenClipHotkey1",ScreenClipHotkey1,SetHotkey22("C2","ScreenClipHotkey1",ScreenClipHotkey1,"New_Screen_Clip1"),"New_Screen_Clip1",ScreenClipHotKeyOnOff)
}
ScreenClipHotKeyOnOff(){
		if(ScreenClipHotKeyOnOff = "Off"){
		ScreenClipHotKeyOnOff = On
		if Not (ScreenClipHotkey1 = None)
			Hotkey, % ScreenClipHotkey1 , New_Screen_Clip1 , On
	}else if(ScreenClipHotKeyOnOff = "On"){
		ScreenClipHotKeyOnOff = Off
	    if Not (ScreenClipHotkey1 = None)
			Hotkey, % ScreenClipHotkey1 , New_Screen_Clip1 , Off
	}
	IniWrite_All_Variable_Values()
}

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Color Picker   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Get_Pixel_Color(){
	While(!GetKeyState("Ctrl")){
        CoordMode,Mouse,Screen
        CoordMode,Pixel,Screen
        MouseGetPos,tcx,tcy
        PixelGetColor,OUTPUTCOLOR,tcx,tcy,RGB
		UPDATECOLORDISPLAYS(OUTPUTCOLOR)
		Tooltip, Press ""Ctrl"" to lock color. %OUTPUTCOLOR%
    }
	StringTrimLeft,OUTPUTCOLOR,OUTPUTCOLOR,2
    ToolTip,
}
UPDATECOLORDISPLAYS(OUTPUTCOLOR){
	StringTrimLeft,OUTPUTCOLOR,OUTPUTCOLOR,2
    StringLeft , r ,  OUTPUTCOLOR , 2
    StringTrimLeft,OUTPUTCOLOR,OUTPUTCOLOR,2
    StringLeft , g ,  OUTPUTCOLOR , 2
    StringTrimLeft,OUTPUTCOLOR,OUTPUTCOLOR,2
    StringLeft , b ,  OUTPUTCOLOR , 2
    r:= "0x" r,g:="0x" g,b:="0x" b
    ColorPickerREDSLIDERVALUE:=r+0, ColorPickerGreenSLIDERVALUE:=g+0, ColorPickerBlueSLIDERVALUE:=b+0
    GuiControl,C3:,ColorPickerREDSLIDERVALUE,% ColorPickerREDSLIDERVALUE
    GuiControl,C3:,ColorPickerGreenSLIDERVALUE,% ColorPickerGreenSLIDERVALUE
    GuiControl,C3:,ColorPickerBlueSLIDERVALUE,% ColorPickerBlueSLIDERVALUE
    UPDATERGBCOLORBLOCK(ColorPickerREDSLIDERVALUE,ColorPickerGreenSLIDERVALUE,ColorPickerBlueSLIDERVALUE)
}
UPDATERGBCOLORBLOCK(ColorPickerREDSLIDERVALUEt,ColorPickerGREENSLIDERVALUEt,ColorPickerBLUESLIDERVALUEt){
    GuiControl,C3:,ColorPickerREDDECVALUE,% ColorPickerREDSLIDERVALUEt
    GuiControl,C3:,ColorPickerGREENDECVALUE,% ColorPickerGREENSLIDERVALUEt
    GuiControl,C3:,ColorPickerBLUEDECVALUE,% ColorPickerBLUESLIDERVALUEt
    SETFORMAT , INTEGER , HEX
    ColorPickerREDSLIDERVALUEt += 0 , ColorPickerGREENSLIDERVALUEt += 0 , ColorPickerBLUESLIDERVALUEt += 0
    StringTrimLeft,ColorPickerREDSLIDERVALUEt,ColorPickerREDSLIDERVALUEt,2
    StringTrimLeft,ColorPickerGREENSLIDERVALUEt,ColorPickerGREENSLIDERVALUEt,2
    StringTrimLeft,ColorPickerBLUESLIDERVALUEt,ColorPickerBLUESLIDERVALUEt,2
    SETFORMAT , INTEGER , DECIMAL
    (strlen(ColorPickerREDSLIDERVALUEt)=1)?(ColorPickerREDSLIDERVALUEt:="0" ColorPickerREDSLIDERVALUEt)
    (strlen(ColorPickerGREENSLIDERVALUEt)=1)?(ColorPickerGREENSLIDERVALUEt:="0" ColorPickerGREENSLIDERVALUEt)
    (strlen(ColorPickerBLUESLIDERVALUEt)=1)?(ColorPickerBLUESLIDERVALUEt:="0" ColorPickerBLUESLIDERVALUEt)
    GuiControl,C3:,ColorPickerREDHEXVALUE,% ColorPickerREDSLIDERVALUEt
    GuiControl,C3:,ColorPickerGREENHEXVALUE,% ColorPickerGREENSLIDERVALUEt
    GuiControl,C3:,ColorPickerBLUEHEXVALUE,% ColorPickerBLUESLIDERVALUEt
    ColorPickerRGBCOLORBLOCK:= ColorPickerREDSLIDERVALUEt . ColorPickerGREENSLIDERVALUEt . ColorPickerBLUESLIDERVALUEt
    GuiControl,C3: +c%ColorPickerRGBCOLORBLOCK% , ColorPickerRGBCOLORBLOCK,
}
ColorPickerCLIPRGB(){
	Clipboard = % ColorPickerREDSLIDERVALUE ", " ColorPickerGREENSLIDERVALUE ", " ColorPickerBLUESLIDERVALUE
	SetTimer, ToolTipFollowMouse, On
	ToolTip, Copied
	sleep, 500
	ToolTip,
	SetTimer, ToolTipFollowMouse, Off
}
ColorPickerCLIPHEX(){
	Clipboard:=ColorPickerRGBCOLORBLOCK
	SetTimer, ToolTipFollowMouse, On
	ToolTip, Copied
	sleep, 500
	ToolTip,
	SetTimer, ToolTipFollowMouse, Off
}
ColorPickerRANDOMSETREFRESH(){
	Gui,C3a:destroy
	Create_Control3a_Window()
}
ColorPickerADJUST_SLIDER(){
    Coordmode,Mouse,Client
    SLIDERVALUE:=0
	PixelOnSlider:=0
	KEYADDVALUE:=0
    While(GETKEYSTATE("LButton")){
        MouseGetPos,Rx,Ry
		PixelOnSlider:= ((Ry-91) * -1) + 175
		SLIDERVALUE:=PixelOnSlider * 1.4571428571428571428571428571429
		if(GETKEYSTATE("UP")){
            if(ry-1>90)
				KEYADDVALUE:=KEYADDVALUE+1
            KeyWait,Up,Up
        }else if(GETKEYSTATE("Down")){
            if(ry+1<267)
				KEYADDVALUE:=KEYADDVALUE-1
            KeyWait,Down,Up
        }else if(GETKEYSTATE("Left")){
            if(ry+1<267)
				KEYADDVALUE:=KEYADDVALUE-1

        }else if(GETKEYSTATE("Right")){
            if(ry-1>90)
				KEYADDVALUE:=KEYADDVALUE+1
        }
		SLIDERVALUE:=Round(SLIDERVALUE)+KEYADDVALUE

		if(SLIDERVALUE = "256")
			KEYADDVALUE:=KEYADDVALUE-1
		if(SLIDERVALUE = "-1")
			KEYADDVALUE:=KEYADDVALUE+1

        (SLIDERVALUE < 0) ? (SLIDERVALUE:=0) : (SLIDERVALUE > 255) ? (SLIDERVALUE:=255)
		if(A_GuiControl="ColorPickerREDTRIGGER"){
        ColorPickerREDSLIDERVALUE:=SLIDERVALUE
        GuiControl,C3:,ColorPickerREDSLIDERVALUE,% ColorPickerREDSLIDERVALUE
        ToolTip,% ColorPickerREDSLIDERVALUE
        }else if(A_GuiControl="ColorPickerGREENTRIGGER"){
        ColorPickerGREENSLIDERVALUE:=SLIDERVALUE
        GuiControl,C3:,ColorPickerGREENSLIDERVALUE,% ColorPickerGREENSLIDERVALUE
        ToolTip,% ColorPickerGREENSLIDERVALUE
        }else if(A_GuiControl="ColorPickerBLUETRIGGER"){
        ColorPickerBLUESLIDERVALUE:=SLIDERVALUE
        GuiControl,C3:,ColorPickerBLUESLIDERVALUE,% ColorPickerBLUESLIDERVALUE
        ToolTip,% ColorPickerBLUESLIDERVALUE
        }
        UPDATERGBCOLORBLOCK(ColorPickerREDSLIDERVALUE,ColorPickerGREENSLIDERVALUE,ColorPickerBLUESLIDERVALUE)
    }
    ToolTip,
}





;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Settings Gui Appearance   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ButtonTextColorTop(){
	SetColorTheme("S2","ButtonTextColorTop","Create_Setting2_Window")
}
ButtonTextColorBottom(){
	SetColorTheme("S2","ButtonTextColorBottom","Create_Setting2_Window")
}
ButtonColor(){
	SetColorTheme("S2","ButtonColor","Create_Setting2_Window")
}
ButtonOutline(){
	SetColorTheme("S2","ButtonOutline","Create_Setting2_Window")
}
ButtonHoverOutline(){
	SetColorTheme("S2","ButtonHoverOutline","Create_Setting2_Window")
}
ButtonFont(){
	SetColorTheme("S2","ButtonFont","Create_Setting2_Window")
}
ButtonColor2(){
	SetColorTheme("S2","ButtonColor2","Create_Setting2_Window")
}
ButtonColor3(){
	SetColorTheme("S2","ButtonColor3","Create_Setting2_Window")
}
ButtonTextSize(){
	SetColorTheme("S2","ButtonTextSize","Create_Setting2_Window")
}
ButtonColor4(){
	SetColorTheme("S2","ButtonColor4","Create_Setting2_Window")
}
ButtonColor5(){
	SetColorTheme("S2","ButtonColor5","Create_Setting2_Window")
}
ButtonColor6(){
	SetColorTheme("S2","ButtonColor6","Create_Setting2_Window")
}
ButtonColor7(){
	SetColorTheme("S2","ButtonColor7","Create_Setting2_Window")
}
ButtonPressedOutline(){
	SetColorTheme("S2","ButtonPressedOutline","Create_Setting2_Window")
}

TabTextColor(){
	SetColorTheme("S3","TabTextColor","Create_Setting3_Window")
}
TabColor(){
	SetColorTheme("S3","TabColor","Create_Setting3_Window")
}
TabFont(){
	SetColorTheme("S3","TabFont","Create_Setting3_Window")
}
TabPressedColor(){
	SetColorTheme("S3","TabPressedColor","Create_Setting3_Window")
}
TabReleasedColor(){
	SetColorTheme("S3","TabReleasedColor","Create_Setting3_Window")
}

ToggleTextColor(){
	SetColorTheme("S4","ToggleTextColor","Create_Setting4_Window")
}
ToggleColor(){
	SetColorTheme("S4","ToggleColor","Create_Setting4_Window")
}
ToggleFont(){
	SetColorTheme("S4","ToggleFont","Create_Setting4_Window")
}
ToggleTextSize(){
	SetColorTheme("S4","ToggleTextSize","Create_Setting4_Window")
}
ToggleEnabledColor(){
	SetColorTheme("S4","ToggleEnabledColor","Create_Setting4_Window")
}
ToggleDisabledColor(){
	SetColorTheme("S4","ToggleDisabledColor","Create_Setting4_Window")
}
ToggleKnobColor(){
	SetColorTheme("S4","ToggleKnobColor","Create_Setting4_Window")
}
ToggleKnobColor2(){
	SetColorTheme("S4","ToggleKnobColor2","Create_Setting4_Window")
}

LineColor(){
	SetColorTheme("S5","LineColor","Create_Setting5_Window")
}
TextColor(){
	SetColorTheme("S5","TextColor","Create_Setting5_Window")
}
BackgroundColor(){
	SetColorTheme("S5","BackgroundColor","Create_Setting5_Window")
}
TextFont(){
	SetColorTheme("S5","TextFont","Create_Setting5_Window")
}
EditBoxColor(){
	SetColorTheme("S5","EditBoxColor","Create_Setting5_Window")
}

SetColorTheme(Gui,Var,Number){
 	SetTimer,ToolTipFollowMouse, On
	GuiControl,% GUI ":-ReadOnly",% Var
	GuiControl,% GUI ":Focus",% Var
	ToolTip, Enter to Confirm
    Loop{
		If GetKeyState("Enter"){
			ToolTip,
	        GUI,% GUI ":Submit", NoHide
		    GuiControl,% GUI ":+ReadOnly",% Var

			Gui,SubSetting:destroy
			Gui,S1:destroy
			Gui,% Gui ":destroy"

			Gui,2:destroy
			Gui,3:destroy
			Gui,4:destroy
			Gui,5:destroy
			Gui,1:destroy

			Create_Main_Window() ;Gui 1
            Create_SubTop_Window() ;Gui 2
			Create_SubBottom_Window() ;Gui 3
			Create_SubLeft_Window() ;Gui 4
			Create_SubRight_Window() ;Gui 5

			Create_SubSetting_Window() ;Gui SubSeting
			Create_Setting1_Window() ;Gui S1
			Func(Number).Bind(PARAMETER).Call()
			break
		}
	    sleep, 25
	}
	SetTimer,ToolTipFollowMouse, Off
	IniWrite_All_Variable_Values()
return
}

ResetButtonSettings(){
	DefaultButtonSettings()

	Create_Main_Window() ;Gui 1
    Create_SubTop_Window() ;Gui 2
	Create_SubBottom_Window() ;Gui 3
	Create_SubLeft_Window() ;Gui 4
	Create_SubRight_Window() ;Gui 5

	Create_SubSetting_Window() ;Gui SubSeting
	Create_Setting1_Window() ;Gui S1
	Create_Setting2_Window() ;Gui S2

	IniWrite_All_Variable_Values()

}
ResetTabsSettings(){
	DefaultTabsSettings()

	Create_Main_Window() ;Gui 1
    Create_SubTop_Window() ;Gui 2
	Create_SubBottom_Window() ;Gui 3
	Create_SubLeft_Window() ;Gui 4
	Create_SubRight_Window() ;Gui 5

	Create_SubSetting_Window() ;Gui SubSeting
	Create_Setting1_Window() ;Gui S1
	Create_Setting3_Window() ;Gui S3

	IniWrite_All_Variable_Values()
}
ResetToggleSettings(){
	DefaultToggleSettings()

	Create_Main_Window() ;Gui 1
    Create_SubTop_Window() ;Gui 2
	Create_SubBottom_Window() ;Gui 3
	Create_SubLeft_Window() ;Gui 4
	Create_SubRight_Window() ;Gui 5

	Create_SubSetting_Window() ;Gui SubSeting
	Create_Setting1_Window() ;Gui S1
	Create_Setting4_Window() ;Gui S4

	IniWrite_All_Variable_Values()
}
ResetOtherSettings(){
	DefaultOtherSettings()

	Create_Main_Window() ;Gui 1
    Create_SubTop_Window() ;Gui 2
	Create_SubBottom_Window() ;Gui 3
	Create_SubLeft_Window() ;Gui 4
	Create_SubRight_Window() ;Gui 5

	Create_SubSetting_Window() ;Gui SubSeting
	Create_Setting1_Window() ;Gui S1
	Create_Setting5_Window() ;Gui S5

	IniWrite_All_Variable_Values()
}





;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Settings SeizeControl Window Settings   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OpenOnStartUp(){
	if(OpenOnStartUp = "Off"){
		OpenOnStartUp = On
	}else if(OpenOnStartUp = "On"){
		OpenOnStartUp = Off
	}
	OpenOnStartUp_Set()
	IniWrite_All_Variable_Values()
	return
}
StartMinimized(){
	if(StartMinimized = "Off"){
		StartMinimized = On
	}else if(StartMinimized = "On"){
		StartMinimized = Off
	}
	IniWrite_All_Variable_Values()
	return
}
StartCompacted(){
	if(StartCompacted = "Off"){
		StartCompacted = On
	}else if(StartCompacted = "On"){
		StartCompacted = Off
	}
	IniWrite_All_Variable_Values()
	return
}

CloseButtonMinimizesToTray(){
	Gui,2:destroy
	if(CloseButtonMinimizesToTray = "Off"){
		CloseButtonMinimizesToTray = On
	}else if(CloseButtonMinimizesToTray = "On"){
		CloseButtonMinimizesToTray = Off
	}
	Create_SubTop_Window()
	IniWrite_All_Variable_Values()
	return
}

MainWindow_AlwaysOnTop(){
	if(MainWindow_AlwaysOnTop = "Off"){
		MainWindow_AlwaysOnTop = On
	}else if(MainWindow_AlwaysOnTop = "On"){
		MainWindow_AlwaysOnTop = Off
	}
	Create_Main_Window()
	IniWrite_All_Variable_Values()
	return
}
MainWindow_ToolWindow(){
	if(MainWindow_ToolWindow = "Off"){
		MainWindow_ToolWindow = On
	}else if(MainWindow_ToolWindow = "On"){
		MainWindow_ToolWindow = Off
	}
	Create_Main_Window()
	IniWrite_All_Variable_Values()
	return
}


OpenOnStartUp_Set(){
	IniWrite_All_Variable_Values()
	if not A_IsAdmin{
		Run *RunAs "%A_ScriptFullPath%"
		return
	}

	if (OpenOnStartUp = "On"){
		FileCreateShortcut,%A_ScriptFullPath%, C:\Users\<UserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\SeizeControl_%version%.lnk
		FileCreateShortcut,%A_ScriptFullPath%, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\SeizeControl_%version%.lnk
	}
	if (OpenOnStartUp = "Off"){
		FileDelete, C:\Users\<UserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\SeizeControl_%version%.lnk
		FileDelete, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\SeizeControl_%version%.lnk
	}

	IniWrite_All_Variable_Values()
}





;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Settings SeizeControl Window Settings   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SetCloseAppHotkey(){
	SetHotkey33("S7","CloseAppHotkey",CloseAppHotkey,SetHotkey22("S7","CloseAppHotkey",CloseAppHotkey,"CloseApp"),"CloseApp",CloseAppHotKeyOnOff)
}
CloseAppHotKeyOnOff(){
	if(CloseAppHotKeyOnOff = "Off"){
		CloseAppHotKeyOnOff = On
		if Not (CloseAppHotkey = None)
			Hotkey, % CloseAppHotkey , CloseApp , On
	}else if(CloseAppHotKeyOnOff = "On"){
		CloseAppHotKeyOnOff = Off
		if Not (CloseAppHotkey = None)
			Hotkey, % CloseAppHotkey , CloseApp , Off
	}
	IniWrite_All_Variable_Values()
	return
}



;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Class & Functions   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ToolTipFollowMouse(){
    MouseGetPos,MouseXpos,MouseYpos
    Process,Exist
    hwnd:=WinExist("ahk_class tooltips_class32 ahk_pid " ErrorLevel)
    WinGetPos,,,w,h,ahk_id %hwnd%
	Xpos = 16
	Ypos = 16
    DllCall("MoveWindow","Uptr",hwnd,"Int",MouseXpos+Xpos,"Int",MouseYpos+Ypos,"Int",w,"Int",h,"Int",0)
}
SetHotkey11(Gui, X, Y, VarValueName, VarValue, Label1, Label2, Label3, ToggleStatus){
	New Toggle_Switch_1(x:=X,y:=Y,w:=30,Text1:="", Text2:="", Window:=Gui, State:=ToggleStatus,Label:=Label2)
	Gui, % Gui ":Add", Text, % "x"(X+30) " y"Y " w90 g"Label1,
    Gui, % Gui ":Add", Hotkey, % "v"VarValueName " x"(X+30) " y"Y " w90 h20 Disabled Center", % VarValue
	if (ToggleStatus = 0) and Not (VarValue = None)
		Hotkey, % VarValue , % Label3 , Off
	if (ToggleStatus = 1) and Not (VarValue = None)
		Hotkey, % VarValue , % Label3 , On
}
SetHotkey22(Gui,VarName,VarValue,Label){
	SetTimer,ToolTipFollowMouse, On
	GuiControl, % Gui ":Enabled", % VarName
	GuiControl, % Gui ":Focus", % VarName
	ToolTip, Enter to Confirm
	if Not (VarValue = None)
		Hotkey, % VarValue , % Label , Off
    Loop{
		If GetKeyState("Enter"){
			ToolTip,
			Gui, % Gui ": Submit", NoHide
			SetTimer,ToolTipFollowMouse, Off
			return, 1
    	}
		If GetKeyState("BackSpace"){
			ToolTip,
			if Not (VarValue = None)
				Hotkey, % VarValue , % Label , Off
			GuiControl, % Gui ":Disabled", % VarName
			break
		}
		sleep, 25
	}
	SetTimer,ToolTipFollowMouse, Off
	return, 0
}
SetHotkey33(Gui,VarName,VarValue,Status,Label,ToggleStatus){
	if (Status = 1){
		if Not (VarValue = None)
			if (ToggleStatus = On)
				Hotkey, % VarValue , % Label , On ;Seperated since VarValue needs to update by Gui, % Gui ": Submit", NoHide
		GuiControl, % Gui ":Disabled", % VarName
	} else
		GuiControl, % Gui ":Disabled", % VarName
}

EditBoxSetValue(Gui,Var,Number){
 	SetTimer,ToolTipFollowMouse, On
	GuiControl,% GUI ":-ReadOnly",% Var
	GuiControl,% GUI ":Focus",% Var
	ToolTip, Enter to Confirm
    Loop{
		If GetKeyState("Enter"){
			ToolTip,
	        GUI,% GUI ":Submit", NoHide
		    GuiControl,% GUI ":+ReadOnly",% Var

			;Gui,% Gui ":destroy"
			;Func(Number).Bind(PARAMETER).Call()
			break
		}
	    sleep, 25
	}
	SetTimer,ToolTipFollowMouse, Off
	IniWrite_All_Variable_Values()
return
}

CoordGetWin(xCoord, yCoord, ExludeWinID="") {
	WinGet, IDs, List,,, Program Manager
	Loop, %ids% {
		_hWin := ids%A_Index%
		WinGetTitle, title, ahk_id %_hWin%
		WinGetPos, left, top, right, bottom, ahk_id %_hWin%
		if (title == "")
			continue
		right += left, bottom += top
		if (xCoord >= left && xCoord <= right && yCoord >= top && yCoord <= bottom && _hWin != ExludeWinID)
			break
	}
	return _hWin
}

CoordGetWin2(xCoord, yCoord, ExludeWinID="", ExludeWinID2="") {
	WinGet, IDs, List,,, Program Manager
	Loop, %ids% {
		_hWin := ids%A_Index%
		WinGetTitle, title, ahk_id %_hWin%
		WinGetPos, left, top, right, bottom, ahk_id %_hWin%
		if (title == "")
			continue
		right += left, bottom += top
		if (xCoord >= left && xCoord <= right && yCoord >= top && yCoord <= bottom && _hWin != ExludeWinID)
			if (xCoord >= left && xCoord <= right && yCoord >= top && yCoord <= bottom && _hWin != ExludeWinID2)
				break
	}
	return _hWin
}

HB_Button_Hover(){
	static Hover_On,Index
	MouseGetPos,,,,ctrl,2
	if(!Hover_On&&ctrl){
		Loop,% HB_Button.Length()	{
			if(ctrl=HB_Button[A_Index].Hwnd)
				HB_Button[A_Index].Draw_Hover(),Index:=A_Index,Hover_On:=1,break
		}
	}else if(Hover_On){
		if(HB_Button[Index].Hwnd!=ctrl)
			HB_Button[Index].Draw_Default(),Hover_On:=0
	}
}

Class Custom_Window	{
	__New(x:="",y:="",w:=300,h:=200,Name:=1,Options:="+AlwaysOnTop -Caption -DPIScale",Title:="",Background_Bitmap:=""){
		This.X:=x,This.Y:=y,This.W:=w,This.H:=h,This.Name:=Name,This.Title:=Title,This.Options:=Options,This.Background_Bitmap:=Background_Bitmap
		This.Create_Window()
	}
	Create_Window(){
		Gui,% This.Name ":New",%  This.Options " +LastFound"
		This.Hwnd:=WinExist()
		if(This.Background_Bitmap)
			This.Draw_Background_Bitmap()
	}
	Draw_Background_Bitmap(){
		This.Bitmap:=Gdip_CreateHBITMAPFromBitmap(This.Background_Bitmap)
		Gdip_DisposeImage(This.Background_Bitmap)
		Gui,% This.Name ":Add",Picture,% "x0 y0 w" This.W " h" This.H " 0xE hwndhwnd"
		This.Background_Hwnd:=hwnd
		SetImage(This.Background_Hwnd,This.Bitmap)
	}
	Show_Window(){
		if(This.X&&This.Y)
			Gui,% This.Name ":Show",% "x" This.X " y" This.Y " w" This.W " h" This.H,% This.Title
		else if(This.X&&!This.Y)
			Gui,% This.Name ":Show",% "x" This.X  " w" This.W " h" This.H,% This.Title
		else if(!This.X&&This.Y)
			Gui,% This.Name ":Show",% "y" This.Y  " w" This.W " h" This.H,% This.Title
		else
			Gui,% This.Name ":Show",% " w" This.W " h" This.H,% This.Title
	}
}

Class Buttons_1	{
	__New(x:=10, y:=10, w:=100, h:=30, window:="1", Label:="", Text:="Button", y_Offset:=0){
		This.X:=x,This.Y:=y,This.W:=w,This.H:=h,This.Window:=window,This.Label:=Label, This.Text:=Text, This.Y_Offset:=y_Offset

		This.Font_Size:="10 Bold"

		This._Create_Trigger(),This._Create_Default_Bitmap(),This._Create_Hover_Bitmap(),This._Create_Pressed_Bitmap()
		Sleep, 20
		This.Draw_Default()
		GuiControl,% This.Window ":Focus",% This.Hwnd
	}
	_Create_Trigger(){
		local hwnd,bbp
		Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w" This.W " h" This.H " hwndhwnd 0xE"
		This.Hwnd:=hwnd
		bbp:=This._Draw_Pressed.Bind(This)
		GuiControl,% This.Window ":+G",% This.Hwnd,% bbp
		if(This.Label)
			(isFunc(This.Label))?(This.Function:=Func(This.Label))
	}
    _Create_Default_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , This.H )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonColor )
		Gdip_FillRectangle( G , Brush , -2 , 0 , This.W+3 , This.H+3 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonOutline )
		Gdip_FillRectangle( G , Brush , 3 , 3 , This.W-6 , This.H-6 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 4 , 3 , This.W-9 , This.H-7 , "0xFF"ButtonColor2,"0xFF"ButtonColor3, 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , This.W-8 , This.H-8 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 4 , This.W-5 , 4 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonTextColorBottom )
		Gdip_TextToGraphics( G , This.Text , "s" ButtonTextSize " Bold Center vCenter c" Brush " x0 y" 1+This.Y_Offset , ButtonFont , This.W , This.H )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonTextColorTop )
		Gdip_TextToGraphics( G , This.Text , "s" ButtonTextSize " Bold Center vCenter c" Brush " x1 y" 2+This.Y_Offset , ButtonFont , This.W , This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Default_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Hover_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , This.H )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonColor )
		Gdip_FillRectangle( G , Brush , -2 , 0 , This.W+3 , This.H+3 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonHoverOutline  )
		Gdip_FillRectangle( G , Brush , 3 , 3 , This.W-6 , This.H-6 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 4 , 3 , This.W-9 , This.H-7 , "0xFF"ButtonColor4 , "0xFF"ButtonColor5 , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , This.W-8 , This.H-8 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 4 , This.W-5 , 4 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonTextColorBottom )
		Gdip_TextToGraphics( G , This.Text , "s" ButtonTextSize " Bold Center vCenter c" Brush " x0 y" 1+This.Y_Offset , ButtonFont , This.W , This.H )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonTextColorTop )
		Gdip_TextToGraphics( G , This.Text , "s" ButtonTextSize " Bold Center vCenter c" Brush " x1 y" 2+This.Y_Offset , ButtonFont , This.W , This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Hover_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Pressed_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , This.H )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonColor )
		Gdip_FillRectangle( G , Brush , -2 , 0 , This.W+3 , This.H+3 )
		Gdip_DeleteBrush( Brush )
		;----------------------------------------------------------------
		;credit jeeswg   -  https://www.autohotkey.com/boards/viewtopic.php?f=76&t=65764
		cc:="0xFF"ButtonHoverOutline
		Match := StrSplit(RegExReplace(cc, "^0x(..)(..)(..)(..)$", "0x$1 0x$2 0x$3 0x$4"), " ")
		cc := Format("0x{:02X}{:02X}{:02X}{:02X}", Match.1, Max(Match.2-0x33,0), Max(Match.3-0x33,0), Max(Match.4-0x33,0))
		Brush := Gdip_BrushCreateSolid( cc )
		;----------------------------------------------------------------
		Gdip_FillRectangle( G , Brush , 3 , 3 , This.W-6 , This.H-6 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 4 , 3 , This.W-9 , This.H-7 , "0xFF"ButtonColor6, "0xFF"ButtonColor7 , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , This.W-8 , This.H-8 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0x881D232B" , 1 )
		if(HB_Button.Length()+1=884)
		Gdip_DrawLine( G , Pen , 4 , This.H-5 , This.W-5 , This.H-5 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0x881D232B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 4 , This.W-5 , 4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0x881D232B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 4 , 4 , This.H-6 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0x881D232B" , 1 )
		Gdip_DrawLine( G , Pen , This.W-5 , 4 , This.W-5 , This.H-6 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonTextColorBottom )
		Gdip_TextToGraphics( G , This.Text , "s" ButtonTextSize " Bold Center vCenter c" Brush " x0 y" 1+This.Y_Offset , ButtonFont , This.W , This.H )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ButtonTextColorTop )
		Gdip_TextToGraphics( G , This.Text , "s" ButtonTextSize " Bold Center vCenter c" Brush " x1 y" 2+This.Y_Offset , ButtonFont , This.W , This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Pressed_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Draw_Pressed(){
		local ctrl
		GuiControl,% This.Window ":Focus",% This.Hwnd
		SetTimer,HB_Button_Hover,Off
		SetImage(This.Hwnd,This.Pressed_Bitmap)
		While(GetKeyState("LButton"))
			Sleep,10
		SetTimer,HB_Button_Hover,On
		MouseGetPos,,,,ctrl,2
		if(ctrl=This.Hwnd){
			This.Draw_Hover()
			if(This.Function)
				This.Function.Call()
			else if(This.Label)
				gosub,% This.Label
		}else	{
			This.Draw_Default()
		}
	}
	Draw_Hover(){
		SetImage(This.Hwnd,This.Hover_Bitmap)
	}
	Draw_Default(){
		SetImage(This.Hwnd,This.Default_Bitmap)
	}
}

Class logo_Button  {
	__New(x:=10, y:=10, window:="1", Label:=""){
		This.X:=x,This.Y:=y
		This.Window:=window
		This.Label:=Label
		This.W:="47",This.H:="50",This.Text:="", This.Y_Offset:="0"

		This._Create_Trigger(),This._Create_Default_Bitmap(),This._Create_Hover_Bitmap()
		Sleep, 20

		if (ContextMenu = 1){
			This.Draw_Hover()
	    }else {
			This.Draw_Default()
		}

		GuiControl,% This.Window ":Focus",% This.Hwnd
	}
	_Create_Trigger(){
		local hwnd,bbp
		Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w" This.W " h" This.H " hwndhwnd 0xE"
		This.Hwnd:=hwnd
		bbp:=This._Draw_Pressed.Bind(This)
		GuiControl,% This.Window ":+G",% This.Hwnd,% bbp
		if(This.Label)
			(isFunc(This.Label))?(This.Function:=Func(This.Label))
	}
    _Create_Default_Bitmap(){
	;Bitmap Created Using: HB Bitmap Maker
	pBitmap:=Gdip_CreateBitmap( This.W , This.H )
	 G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 4)
	Brush := Gdip_BrushCreateSolid( "0xFF002240" )
	Gdip_FillPolygon( G , Brush , "4,13|25,4|46,13|46,36|25,45|5,36" )
	Gdip_DeleteBrush( Brush )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 4 , 13 , 25 , 3 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 25 , 3 , 46 , 13 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 45 , 13 , 45 , 37 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 25 , 46 , 46 , 37 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 4 , 37 , 25 , 46 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 5 , 13 , 5 , 37 )
	Gdip_DeletePen( Pen )
	Brush := Gdip_BrushCreateSolid( "0xFFFFFFFF" )
	Gdip_FillEllipse( G , Brush , 12 , 12 , 26 , 26 )
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF002240" )
	Gdip_FillPie( G , Brush , 10 , 2 , 30 , 30 , 30 , 120 )
	Gdip_DeleteBrush( Brush )
	Brush := Gdip_BrushCreateSolid( "0xFF416296" )
	Gdip_FillPie( G , Brush , 17 , 12 , 15 , 15 , -5 , 190 )
	Gdip_DeleteBrush( Brush )
	Pen := Gdip_CreatePen( "0xFFFFFFFF" , 2 )
	Gdip_DrawArc( G , Pen , 10 , 18 , 29 , 29 , 215 , 115 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFFFFFFFF" , 1 )
	Gdip_DrawArc( G , Pen , 10 , 17 , 29 , 29 , 215 , 115 )
	Gdip_DeletePen( Pen )
	Gdip_DeleteGraphics( G )
	This.Default_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
	Gdip_DisposeImage(pBitmap)
}
	_Create_Hover_Bitmap(){
	;Bitmap Created Using: HB Bitmap Maker
	pBitmap:=Gdip_CreateBitmap( This.W , This.H )
	 G := Gdip_GraphicsFromImage( pBitmap )
	Gdip_SetSmoothingMode( G , 4 )
	Brush := Gdip_BrushCreateSolid( "0xFF002240" )
	Gdip_FillPolygon( G , Brush , "4,13|25,4|46,13|46,36|25,45|5,36" )
	Gdip_DeleteBrush( Brush )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 4 , 13 , 25 , 3 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 25 , 3 , 46 , 13 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 45 , 13 , 45 , 37 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 25 , 46 , 46 , 37 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 4 , 37 , 25 , 46 )
	Gdip_DeletePen( Pen )
	Pen := Gdip_CreatePen( "0xFF416296" , 2 )
	Gdip_DrawLine( G , Pen , 5 , 13 , 5 , 37 )
	Gdip_DeletePen( Pen )
	Brush := Gdip_BrushCreateSolid( "0xFFFFFFFF" )
	Gdip_FillEllipse( G , Brush , 12 , 12 , 26 , 26 )
	Gdip_DeleteBrush( Brush )
	Pen := Gdip_CreatePen( "0xFF002240" , 1 )
	Gdip_DrawArc( G , Pen , 11 , 3 , 29 , 29 , 28 , 125 )
	Gdip_DeletePen( Pen )
	Gdip_DeleteGraphics( G )
	This.Hover_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
	Gdip_DisposeImage(pBitmap)
}
	_Draw_Pressed(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		SetTimer,HB_Button_Hover,Off
		if (ContextMenu = 1){
			sleep, 200
			if Not (GetKeyState("LButton")){
				GoSub,% This.Label
			}else {
				While(GetKeyState("LButton")){
					Gui,% This.Window ":+LastFound"
				    PostMessage,0xA1,2
				}
			}
	    }else
			GoSub,% This.Label
		SetImage(This.Hwnd,This.Hover_Bitmap)
		if (ContextMenu = 0)
			SetTimer,HB_Button_Hover,On
	}
	Draw_Hover(){
			SetImage(This.Hwnd,This.Hover_Bitmap)
	}
	Draw_Default(){
		if (ContextMenu = 1)
			SetImage(This.Hwnd,This.Hover_Bitmap)
		else
			SetImage(This.Hwnd,This.Default_Bitmap)
	}
}

Class Toggle_Switch_1	{
	__New(x, y, w:=19, Text1:="Text", Text2:="Text2", Window:="1", State:=0, Label:=""){

		This.X:=x,This.Y:=y,This.W:=w,This.H:=21,This.Text1:=Text1,This.Text2:=Text2,This.State:=State,This.Label:=Label
		This.Window:=Window,This.Create_Off_Bitmap(),This.Create_On_Bitmap(),This.Create_Trigger()
		sleep,20
		(This.State)?(SetImage(This.Hwnd,This.On_Bitmap)):(SetImage(This.Hwnd,This.Off_Bitmap))
	}
	Create_Trigger(){
		Gui , % This.Window ": Add" , Picture , % "x" This.X " y" This.Y " w" This.W " h" This.H " 0xE hwndhwnd"
		This.Hwnd:=hwnd
		BD := THIS.Switch_State.BIND( THIS )
		GUICONTROL +G , % This.Hwnd , % BD
		if(This.Label)
			(isFunc(This.Label))?(This.Function:=Func(This.Label))
	}
	Create_Off_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , 21 )
		 G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 2 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleColor )
		Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleDisabledColor )
		Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleDisabledColor )
		Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x8827282B" )
		Gdip_FillEllipse( G , Brush , 0 , 0 , 18 , 18 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
		Gdip_FillEllipse( G , Brush , 0 , 0 , 17 , 17 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 1 , 1 , 15 , 15 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF" ToggleKnobColor , "0xFF" ToggleKnobColor2 , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 2 , 2 , 13 , 13 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleTextColor )
		Gdip_TextToGraphics( G , This.Text1 , "s" ToggleTextSize " Bold vCenter cFF000000 x32 y-1" , ToggleFont , This.W-33, This.H )
		Gdip_TextToGraphics( G , This.Text1, "s" ToggleTextSize " Bold vCenter c" Brush " x33 y0" , ToggleFont , This.W-33, This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Off_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	Create_On_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( This.W , 21 )
		 G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 2 )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleColor )
		Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
		Gdip_DeleteBrush( Brush )
		Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
		Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
		Gdip_DeletePen( Pen )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleEnabledColor )
		Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF" ToggleEnabledColor )
		Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x8827282B" )
		Gdip_FillEllipse( G , Brush , 11 , 0 , 18 , 18 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
		Gdip_FillEllipse( G , Brush , 11 , 0 , 17 , 17 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 12 , 1 , 15 , 15 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF" ToggleKnobColor , "0xFF" ToggleKnobColor2 , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 13 , 2 , 13 , 13 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF"ToggleTextColor )
		Gdip_TextToGraphics( G , This.Text2 , "s" ToggleTextSize " Bold vCenter cFF000000 x32 y-1" , ToggleFont , This.W-33, This.H )
		Gdip_TextToGraphics( G , This.Text2 , "s" ToggleTextSize " Bold vCenter c" Brush " x33 y0" , ToggleFont , This.W-33, This.H )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.On_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	Switch_State(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		(This.State:=!This.State)?(SetImage(This.Hwnd,This.On_Bitmap)):(SetImage(This.Hwnd,This.Off_Bitmap))
		if(This.Function){
			This.Function.Call()
		}else if(This.Label){
			gosub,% This.Lab
	    }
	}
}

Class Vertical_Dark5_Tabs {
    __New(x:="10", y:="10", window:="1", label:="",Number_Of_tab:="4", Selected_Tab:="1", TabText1:="", TabText2:="", TabText3:="", TabText4:="", TabText5:="", TabText6:=""){
		This.X:=x, This.Y:=y, This.Window:=window, This.Label:=Label, This.Tab_Amount:=Number_Of_tab, This.Tab:=Selected_Tab
		This.TabText1:=TabText1,This.TabText2:=TabText2,This.TabText3:=TabText3,This.TabText4:=TabText4,This.TabText5:=TabText5,This.TabText6:=TabText6

		This.Font:=TabFont, This.Font_Color:="0xFF" TabTextColor

		This._Create_Trigger()

		if (This.Tab_Amount = 6){
			This.V:="199",This.V2:="187",This.V3:="66",This.V4:="97",This.V5:="128",This.V6:="159"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap(),This._Create_Tab3_Bitmap(),This._Create_Tab4_Bitmap(),This._Create_Tab5_Bitmap(),This._Create_Tab6_Bitmap()
		}
		if (This.Tab_Amount = 5){
			This.V:="168",This.V2:="156",This.V3:="66",This.V4:="97",This.V5:="128",This.V6:="200"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap(),This._Create_Tab3_Bitmap(),This._Create_Tab4_Bitmap(),This._Create_Tab5_Bitmap()
		}
		if (This.Tab_Amount = 4){
			This.V:="137",This.V2:="125",This.V3:="66",This.V4:="97",This.V5:="200",This.V6:="200"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap(),This._Create_Tab3_Bitmap(),This._Create_Tab4_Bitmap()
		}
		if (This.Tab_Amount = 3){
			This.V:="100",This.V2:="94",This.V3:="66",This.V4:="200",This.V5:="200",This.V6:="200"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap(),This._Create_Tab3_Bitmap()
		}
		if (This.Tab_Amount = 2){
			This.V:="68",This.V2:="63",This.V3:="200",This.V4:="200",This.V5:="200",This.V6:="200"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap()
		}
		sleep 20
		(This.Tab=1)?(SetImage(This.Hwnd,This.Tab1_Bitmap)):(This.Tab=2)?(SetImage(This.Hwnd,This.Tab2_Bitmap))
		(This.Tab=3)?(SetImage(This.Hwnd,This.Tab3_Bitmap)):(This.Tab=4)?(SetImage(This.Hwnd,This.Tab4_Bitmap))
		(This.Tab=5)?(SetImage(This.Hwnd,This.Tab5_Bitmap)):(This.Tab=6)?(SetImage(This.Hwnd,This.Tab6_Bitmap))
	}

	_Create_Trigger(){
		local hwnd
		Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w413 h36 hwndhwnd 0xE"
		This.hwnd:=hwnd

		Gui,% This.Window ":Add",Text,% "x" This.X+4 " y" This.Y+4 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab1.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind

		if (This.Tab_Amount > 1){
		Gui,% This.Window ":Add",Text,% "x" This.X+4 " y" This.Y+35 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab2.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind
		}

		if (This.Tab_Amount > 2){
		Gui,% This.Window ":Add",Text,% "x" This.X+4 " y" This.Y+67 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab3.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind
		}

		if (This.Tab_Amount > 3){
		Gui,% This.Window ":Add",Text,% "x" This.X+4 " y" This.Y+97 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab4.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind
		}

		if (This.Tab_Amount > 4){
		Gui,% This.Window ":Add",Text,% "x" This.X+4 " y" This.Y+128 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab5.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind
	    }

		if (This.Tab_Amount > 5){
		Gui,% This.Window ":Add",Text,% "x" This.X+4 " y" This.Y+159 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab6.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind
	    }

		if(This.Label)
			(isFunc(This.Label))?(This.Function:=Func(This.Label))
	}

	_Create_Tab1_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( 112 , This.V )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 110 , 135 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 3 , 102 , This.V2 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V6 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V5 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 35 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 99 , 29 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x3 y37" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x4 y38" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x3 y68" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x4 y69" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x3 y99" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x4 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x3 y130" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x4 y131" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x3 y161" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x4 y162" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 35 , 102 , 35 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V4 , 102 , This.V4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V3 , 102 , This.V3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab1_Bitmap:= Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab2_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( 112 , This.V )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 110 , 135 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 3 , 102 , This.V2 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V6 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V5 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 35 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x3 y37" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x4 y38" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x3 y68" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x4 y69" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x3 y99" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x4 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x3 y130" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x4 y131" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x3 y161" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x4 y162" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 35 , 102 , 35 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V4 , 102 , This.V4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V3 , 102 , This.V3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab2_Bitmap:= Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab3_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( 112 , This.V )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 110 , 135 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 3 , 102 , This.V2 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V6 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V5 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V3 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 35 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x3 y37" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x4 y38" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x3 y68" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x4 y69" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x3 y99" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x4 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x3 y130" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x4 y131" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x3 y161" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x4 y162" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 35 , 102 , 35 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V4 , 102 , This.V4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V3 , 102 , This.V3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab3_Bitmap:= Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab4_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( 112 , This.V )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 110 , 135 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 3 , 102 , This.V2 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V6 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V5 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V4 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 35 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x3 y37" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x4 y38" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x3 y68" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x4 y69" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x3 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x4 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x3 y130" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x4 y131" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x3 y161" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x4 y162" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 35 , 102 , 35 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V4 , 102 , This.V4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V3 , 102 , This.V3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab4_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab5_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( 112 , This.V )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 110 , 135 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 3 , 102 , This.V2 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V6 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V5 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 35 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x3 y37" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x4 y38" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x3 y68" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x4 y69" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x3 y99" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x4 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x3 y130" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x4 y131" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x3 y161" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x4 y162" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 35 , 102 , 35 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V4 , 102 , This.V4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V3 , 102 , This.V3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab5_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab6_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( 112 , This.V )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 110 , 135 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 3 , 102 , This.V2 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V6 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V5 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , This.V3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 35 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x3 y37" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x4 y38" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x3 y68" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x4 y69" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x3 y99" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x4 y100" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x3 y130" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText5 , "s12 Center vCenter Bold c" Brush " x4 y131" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x3 y161" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText6 , "s12 Center vCenter Bold c" Brush " x4 y162" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , 35 , 102 , 35 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V4 , 102 , This.V4 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 4 , This.V3 , 102 , This.V3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab6_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}

    _Switch_Tab1(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=1){
			SetImage(This.Hwnd,This.Tab1_Bitmap)
			This.Tab:=1
			VD5Tab=1
			This._Sub_Redirect()
		}
	}
	_Switch_Tab2(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=2){
			SetImage(This.Hwnd,This.Tab2_Bitmap)
			This.Tab:=2
			VD5Tab=2
			This._Sub_Redirect()
		}
	}
	_Switch_Tab3(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=3){
			SetImage(This.Hwnd,This.Tab3_Bitmap)
			This.Tab:=3
			VD5Tab=3
			This._Sub_Redirect()
		}
	}
	_Switch_Tab4(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=4){
			SetImage(This.Hwnd,This.Tab4_Bitmap)
			This.Tab:=4
			VD5Tab=4
			This._Sub_Redirect()
		}
	}
	_Switch_Tab5(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=5){
			SetImage(This.Hwnd,This.Tab5_Bitmap)
			This.Tab:=5
			VD5Tab=5
			This._Sub_Redirect()
		}
	}
	_Switch_Tab6(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=6){
			SetImage(This.Hwnd,This.Tab6_Bitmap)
			This.Tab:=6
			VD5Tab=6
			This._Sub_Redirect()
		}
	}

	_Sub_Redirect(){
		if(This.Function){
			This.Function.Call()
		}else if(This.Label){
			gosub,% This.Label
		}
	}
}

Class Horizontal_4Tabs {
    __New(x:="10", y:="10", window:="1", label:="",Number_Of_tab:="4", Selected_Tab:="1", TabText1:="", TabText2:="", TabText3:="", TabText4:=""){
		This.X:=x, This.Y:=y, This.Window:=window, This.Label:=Label, This.Tab_Amount:=Number_Of_tab, This.Tab:=Selected_Tab
		This.TabText1:=TabText1,This.TabText2:=TabText2,This.TabText3:=TabText3,This.TabText4:=TabText4

		This.Font:=TabFont, This.Font_Color:="0xFF" TabTextColor

		This._Create_Trigger()

		if (This.Tab_Amount = 4){
			This.V:="413",This.V2:="415",This.V3:="407",This.V4:="309",This.V5:="207"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap(),This._Create_Tab3_Bitmap(),This._Create_Tab4_Bitmap()
		}
		if (This.Tab_Amount = 3){
			This.V:="311",This.V2:="313",This.V3:="305",This.V4:="666",This.V5:="207"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap(),This._Create_Tab3_Bitmap()
		}
		if (This.Tab_Amount = 2){
			This.V:="209",This.V2:="211",This.V3:="203",This.V4:="666",This.V5:="666"
			This._Create_Tab1_Bitmap(),This._Create_Tab2_Bitmap()
		}
		sleep 20
		(This.Tab=1)?(SetImage(This.Hwnd,This.Tab1_Bitmap)):(This.Tab=2)?(SetImage(This.Hwnd,This.Tab2_Bitmap))
		(This.Tab=3)?(SetImage(This.Hwnd,This.Tab3_Bitmap)):(This.Tab=4)?(SetImage(This.Hwnd,This.Tab4_Bitmap))
	}
	_Create_Trigger(){
		local hwnd
		Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w413 h36 hwndhwnd 0xE"
		This.hwnd:=hwnd

		Gui,% This.Window ":Add",Text,% "x" This.X+3 " y" This.Y+6 " w99 h28 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab1.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind

		Gui,% This.Window ":Add",Text,% "x" This.X+104 " y" This.Y+5 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab2.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind

		Gui,% This.Window ":Add",Text,% "x" This.X+206 " y" This.Y+5 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab3.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind

		Gui,% This.Window ":Add",Text,% "x" This.X+309 " y" This.Y+5 " w100 h30 BackgroundTrans hwndhwnd"
		TabBind:=This._Switch_Tab4.Bind(This)
		GuiControl,% This.Window ":+G",% hwnd,% TabBind

		if(This.Label)
			(isFunc(This.Label))?(This.Function:=Func(This.Label))
	}

	_Create_Tab1_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( This.V , 36 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , This.V2 , 42 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 2 , This.V3 , 32 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , This.V4 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , This.V5 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 105 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabPressedColor , "0xFF" TabPressedColor  , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 4 , 99 , 29 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x104 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x105 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x206 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x207 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x308 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x309 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 106 , 3 , 204 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 208 , 3 , 306 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 310 , 3 , 408 , 3 )
		Gdip_DeletePen( Pen )

		Gdip_DeleteGraphics( G )
		This.Tab1_Bitmap:= Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab2_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( This.V , 36 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , This.V2 , 42 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 2 , This.V3 , 32 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , This.V4 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , This.V5 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 106 , 4 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x104 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x105 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x206 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x207 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x308 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x309 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 5 , 3 , 103 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 208 , 3 , 306 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 310 , 3 , 408 , 3 )
		Gdip_DeletePen( Pen )
		Gdip_DeleteGraphics( G )
		This.Tab2_Bitmap:= Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab3_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( This.V , 36 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , This.V2 , 42 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 2 , This.V3 , 32 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , This.V4 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , (This.V5+1) , 4 , 99 , 29 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 106 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x104 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x105 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x206 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x207 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x308 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x309 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 5 , 3 , 103 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 107 , 3 , 205 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 310 , 3 , 408 , 3 )
		Gdip_DeletePen( Pen )
		Gdip_DeleteGraphics( G )
		This.Tab3_Bitmap:= Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Tab4_Bitmap(){
		pBitmap:=Gdip_CreateBitmap( This.V , 36 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 1 )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF"TabColor )
		Gdip_FillRectangle( G , Brush , -2 , -2 , This.V2 , 42 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF141416" )
		Gdip_FillRectangle( G , Brush , 3 , 2 , This.V3 , 32 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , 100 , 100 , "0xFF" TabPressedColor , "0xFF" TabPressedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , (This.V4+1) , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , (This.V5+1) , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 106 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_CreateLineBrushFromRect( 207 , 4 , 98 , 29 , "0xFF" TabReleasedColor , "0xFF" TabReleasedColor , 1 , 1 )
		Gdip_FillRectangle( G , Brush , 4 , 3 , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x3 y6" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText1 , "s12 Center vCenter Bold c" Brush " x4 y7" , "Arial" , 99 , 28 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText2 , "s12 Center vCenter Bold c" Brush " x104 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText2  , "s12 Center vCenter Bold c" Brush " x105 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText3 , "s12 Center vCenter Bold c" Brush " x206 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText3, "s12 Center vCenter Bold c" Brush " x207 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x308 y5" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , This.TabText4 , "s12 Center vCenter Bold c" Brush " x309 y6" , "Arial" , 100 , 30 )
		Gdip_DeleteBrush( Brush )
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 5 , 3 , 103 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 107 , 3 , 205 , 3 )
		Gdip_DeletePen( Pen )
		Pen := Gdip_CreatePen( "0xFF4D535B" , 1 )
		Gdip_DrawLine( G , Pen , 208 , 3 , 306 , 3 )
		Gdip_DeletePen( Pen )
		Gdip_DeleteGraphics( G )
		This.Tab4_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}

    _Switch_Tab1(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=1){
			SetImage(This.Hwnd,This.Tab1_Bitmap)
			This.Tab:=1
			H4Tab=1
			This._Sub_Redirect()
		}
	}
	_Switch_Tab2(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=2){
			SetImage(This.Hwnd,This.Tab2_Bitmap)
			This.Tab:=2
			H4Tab=2
			This._Sub_Redirect()
		}
	}
	_Switch_Tab3(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=3){
			SetImage(This.Hwnd,This.Tab3_Bitmap)
			This.Tab:=3
			H4Tab=3
			This._Sub_Redirect()
		}
	}
	_Switch_Tab4(){
		GuiControl,% This.Window ":Focus",% This.Hwnd
		if(This.Tab!=4){
			SetImage(This.Hwnd,This.Tab4_Bitmap)
			This.Tab:=4
			H4Tab=4
			This._Sub_Redirect()
		}
	}

	_Sub_Redirect(){
		if(This.Function){
			This.Function.Call()
		}else if(This.Label){
			gosub,% This.Label
		}
	}
}

DRAW_OUTLINE( GUI_NAME , X , Y , W , H , COLOR1 :="BLACK", COLOR2 := "BLACK" , THICKNESS := 1 ) {
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y " W" W " H" THICKNESS " BACKGROUND" COLOR1
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y " W" THICKNESS " H" H " BACKGROUND" COLOR1
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X " Y" Y + H - THICKNESS " W" W " H" THICKNESS " BACKGROUND" COLOR2
    GUI , % GUI_NAME ": ADD" , PROGRESS , % "X" X + W - THICKNESS " Y" Y " W" THICKNESS " H" H " BACKGROUND" COLOR2
}

Random_Colour(Range_R_Min:=0,Range_R_Max:=255,Range_G_Min:=0,Range_G_Max:=255,Range_B_Min:=0,Range_B_Max:=255){
	Random, R, Range_R_Min , Range_R_Max
	Random, G, Range_G_Min , Range_G_Max
	Random, B, Range_B_Min , Range_B_Max
        SETFORMAT , INTEGER , HEX
		R += 0 , G += 0 , B += 0
		StringTrimLeft,R,R,2
		StringTrimLeft,G,G,2
		StringTrimLeft,B,B,2
		TEMPCOLOR:= R "" G "" B
		SETFORMAT , INTEGER , DECIMAL
    RETURN TEMPCOLOR
}

;Below are Functions and clases not used, but might be in the future
class NumClass	{
	__New(x:=10,y:=10,window:="1",Font_Color:="ff0000"){
		This.X:=x,This.Y:=y,This.W:=28,This.H:=198,This.Window:=window,This.Font_Color:= "0xFF" Font_Color
		This._Create_Trigger(),This._Create_Num1(),This._Create_Num2(),This._Create_Num3(),This._Create_Num4(),This._Create_Num5(),This._Create_Num6()
		Sleep,20
	}
	_Create_Trigger(){
		local hwnd
		Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w" This.W " h" This.H " hwndhwnd 0xE"
		This.Hwnd:=hwnd
	}
	_Create_Num1(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 198 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 4 )
		Brush := Gdip_BrushCreateSolid( "0xFF333437" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 201 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "1" , "s16 Center Bold c" Brush " x-1 y6" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "1" , "s16 Center Bold c" Brush " x0 y7" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "2" , "s16 Center Bold c" Brush " x-1 y47" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "2" , "s16 Center Bold c" Brush " x0 y48" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "3" , "s16 Center Bold c" Brush " x-1 y88" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "3" , "s16 Center Bold c" Brush " x0 y89" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "4" , "s16 Center Bold c" Brush " x-1 y129" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "4" , "s16 Center Bold c" Brush " x0 y130" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "5" , "s16 Center Bold c" Brush " x-1 y170" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "5" , "s16 Center Bold c" Brush " x0 y171" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Num1_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Num2(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 198 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 4 )
		Brush := Gdip_BrushCreateSolid( "0xFF333437" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 201 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "6" , "s16 Center Bold c" Brush " x-1 y6" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "6" , "s16 Center Bold c" Brush " x0 y7" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "7" , "s16 Center Bold c" Brush " x-1 y47" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "7" , "s16 Center Bold c" Brush " x0 y48" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "8" , "s16 Center Bold c" Brush " x-1 y88" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "8" , "s16 Center Bold c" Brush " x0 y89" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "9" , "s16 Center Bold c" Brush " x-1 y129" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "9" , "s16 Center Bold c" Brush " x0 y130" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "10" , "s16 Center Bold c" Brush " x-1 y170" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "10" , "s16 Center Bold c" Brush " x0 y171" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Num2_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Num3(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 198 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 4 )
		Brush := Gdip_BrushCreateSolid( "0xFF333437" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 201 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "11" , "s16 Center Bold c" Brush " x-1 y6" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "11" , "s16 Center Bold c" Brush " x0 y7" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "12" , "s16 Center Bold c" Brush " x-1 y47" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "12" , "s16 Center Bold c" Brush " x0 y48" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "13" , "s16 Center Bold c" Brush " x-1 y88" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "13" , "s16 Center Bold c" Brush " x0 y89" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "14" , "s16 Center Bold c" Brush " x-1 y129" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "14" , "s16 Center Bold c" Brush " x0 y130" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "15" , "s16 Center Bold c" Brush " x-1 y170" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "15" , "s16 Center Bold c" Brush " x0 y171" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Num3_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Num4(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 198 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 4 )
		Brush := Gdip_BrushCreateSolid( "0xFF333437" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 201 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "16" , "s16 Center Bold c" Brush " x-1 y6" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "16" , "s16 Center Bold c" Brush " x0 y7" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "17" , "s16 Center Bold c" Brush " x-1 y47" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "17" , "s16 Center Bold c" Brush " x0 y48" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "18" , "s16 Center Bold c" Brush " x-1 y88" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "18" , "s16 Center Bold c" Brush " x0 y89" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "19" , "s16 Center Bold c" Brush " x-1 y129" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "19" , "s16 Center Bold c" Brush " x0 y130" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "20" , "s16 Center Bold c" Brush " x-1 y170" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "20" , "s16 Center Bold c" Brush " x0 y171" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Num4_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Num5(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 198 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 4 )
		Brush := Gdip_BrushCreateSolid( "0xFF333437" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 201 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "21" , "s16 Center Bold c" Brush " x-1 y6" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "21" , "s16 Center Bold c" Brush " x0 y7" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "22" , "s16 Center Bold c" Brush " x-1 y47" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "22" , "s16 Center Bold c" Brush " x0 y48" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "23" , "s16 Center Bold c" Brush " x-1 y88" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "23" , "s16 Center Bold c" Brush " x0 y89" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "24" , "s16 Center Bold c" Brush " x-1 y129" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "24" , "s16 Center Bold c" Brush " x0 y130" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "25" , "s16 Center Bold c" Brush " x-1 y170" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "25" , "s16 Center Bold c" Brush " x0 y171" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Num5_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Num6(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 198 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 4 )
		Brush := Gdip_BrushCreateSolid( "0xFF333437" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 201 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "26" , "s16 Center Bold c" Brush " x-1 y6" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "26" , "s16 Center Bold c" Brush " x0 y7" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "27" , "s16 Center Bold c" Brush " x-1 y47" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "27" , "s16 Center Bold c" Brush " x0 y48" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "28" , "s16 Center Bold c" Brush " x-1 y88" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "28" , "s16 Center Bold c" Brush " x0 y89" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "29" , "s16 Center Bold c" Brush " x-1 y129" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "29" , "s16 Center Bold c" Brush " x0 y130" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0xFF000000" )
		Gdip_TextToGraphics( G , "30" , "s16 Center Bold c" Brush " x-1 y170" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( This.Font_Color )
		Gdip_TextToGraphics( G , "30" , "s16 Center Bold c" Brush " x0 y171" , "Segoe Ui" , 28 , 20 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Num6_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	Draw_1(){
		SetImage(This.Hwnd,This.Num1_Bitmap)
	}
	Draw_2(){
		SetImage(This.Hwnd,This.Num2_Bitmap)
	}
	Draw_3(){
		SetImage(This.Hwnd,This.Num3_Bitmap)
	}
	Draw_4(){
		SetImage(This.Hwnd,This.Num4_Bitmap)
	}
	Draw_5(){
		SetImage(This.Hwnd,This.Num5_Bitmap)
	}
	Draw_6(){
		SetImage(This.Hwnd,This.Num6_Bitmap)
	}
}

class Indicator	{
	__New(x:=10,y:=10,Window:="1",Tab1_Value:=0,Tab2_Value:=0,Tab3_Value:=0,Indicator_Color:="0066cc"){
		This.X:=x,This.Y:=y,This.W:=28,This.H:=28,This.Window:=window,This.Color:="0xFF" Indicator_Color,This.HalfColor:=Indicator_Color
		This.Tab1_Value:=Tab1_Value,This.Tab2_Value:=Tab2_Value,This.Tab3_Value:=Tab3_Value,This._Create_Trigger(),This._Create_On_Bitmap(),This._Create_Off_Bitmap()
		(This.Tab1_Value)?(This.Draw_On()):(This.Draw_Off())
	}
	_Create_Trigger(){
		local hwnd
		Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w" This.W " h" This.H " hwndhwnd 0xE"
		This.Hwnd:=hwnd
	}
	_Create_On_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 28 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 2 )
		Brush := Gdip_BrushCreateSolid( "0xFF333333" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 32 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 3 , 5 , 22 , 22 , "0xFF333437" , "0xFF000000" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 4 , 4 , 20 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 1 , 1 , 26 , 25 , "0xFF333437" , "0xFF222222" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 5 , 5 , 18 , 18 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 1 , -1 , 20 , 22 , This.Color , "0xFF333437" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 7 , 7 , 14 , 14 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x33" This.HalfColor )
		Gdip_FillEllipse( G , Brush , 8 , 8 , 11 , 11 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x11" This.HalfColor )
		Gdip_FillEllipse( G , Brush , 10 , 10 , 8 , 8 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x11" This.HalfColor )
		Gdip_FillEllipse( G , Brush , 11 , 11 , 6 , 6 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x11" This.HalfColor )
		Gdip_FillEllipse( G , Brush , 12 , 12 , 4 , 4 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.On_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	_Create_Off_Bitmap(){
		;Bitmap Created Using: HB Bitmap Maker
		pBitmap:=Gdip_CreateBitmap( 28 , 28 )
		G := Gdip_GraphicsFromImage( pBitmap )
		Gdip_SetSmoothingMode( G , 2 )
		Brush := Gdip_BrushCreateSolid( "0xFF333333" )
		Gdip_FillRectangle( G , Brush , -2 , -2 , 32 , 32 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 3 , 5 , 22 , 22 , "0xFF333437" , "0xFF000000" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 4 , 4 , 20 , 20 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 1 , 1 , 26 , 25 , "0xFF333437" , "0xFF222222" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 5 , 5 , 18 , 18 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_CreateLineBrushFromRect( 1 , -1 , 20 , 22 , "0xFF666869" , "0xFF333437" , 1 , 1 )
		Gdip_FillEllipse( G , Brush , 7 , 7 , 14 , 14 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x33666869" )
		Gdip_FillEllipse( G , Brush , 8 , 8 , 11 , 11 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x11666869" )
		Gdip_FillEllipse( G , Brush , 10 , 10 , 8 , 8 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x11666869" )
		Gdip_FillEllipse( G , Brush , 11 , 11 , 6 , 6 )
		Gdip_DeleteBrush( Brush )
		Brush := Gdip_BrushCreateSolid( "0x11666869" )
		Gdip_FillEllipse( G , Brush , 12 , 12 , 4 , 4 )
		Gdip_DeleteBrush( Brush )
		Gdip_DeleteGraphics( G )
		This.Off_Bitmap:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
		Gdip_DisposeImage(pBitmap)
	}
	Draw_On(){
		SetImage(This.Hwnd,This.On_Bitmap)
	}
	Draw_Off(){
		SetImage(This.Hwnd,This.Off_Bitmap)
	}
}

;Below function was modified because original didnt work
Gdip_BitmapFromScreenModified(x,y,w,h){
chdc := CreateCompatibleDC(), hbm := CreateDIBSection(w, h, chdc), obm := SelectObject(chdc, hbm), hhdc := hhdc ? hhdc : GetDC()
BitBlt(chdc, 0, 0, w, h, hhdc, x, y, Raster)
ReleaseDC(hhdc)
pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
SelectObject(chdc, obm), DeleteObject(hbm), DeleteDC(hhdc), DeleteDC(chdc)
return pBitmap
}
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Gdip   %%%%%%%5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Gdip standard library v1.45 by tic (Tariq Porter) 07/09/11   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Modifed by Rseding91 using fincs 64 bit compatible Gdip library 5/1/2013  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Supports: Basic, _L ANSi, _L Unicode x86 and _L Unicode x64  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UpdateLayeredWindow(hwnd, hdc, x="", y="", w="", h="", Alpha=255)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if ((x != "") && (y != ""))
VarSetCapacity(pt, 8), NumPut(x, pt, 0, "UInt"), NumPut(y, pt, 4, "UInt")
if (w = "") ||(h = "")
WinGetPos,,, w, h, ahk_id %hwnd%
return DllCall("UpdateLayeredWindow"
, Ptr, hwnd
, Ptr, 0
, Ptr, ((x = "") && (y = "")) ? 0 : &pt
, "int64*", w|h<<32
, Ptr, hdc
, "int64*", 0
, "uint", 0
, "UInt*", Alpha<<16|1<<24
, "uint", 2)
}
BitBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, Raster="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdi32\BitBlt"
, Ptr, dDC
, "int", dx
, "int", dy
, "int", dw
, "int", dh
, Ptr, sDC
, "int", sx
, "int", sy
, "uint", Raster ? Raster : 0x00CC0020)
}
StretchBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, sw, sh, Raster="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdi32\StretchBlt"
, Ptr, ddc
, "int", dx
, "int", dy
, "int", dw
, "int", dh
, Ptr, sdc
, "int", sx
, "int", sy
, "int", sw
, "int", sh
, "uint", Raster ? Raster : 0x00CC0020)
}
SetStretchBltMode(hdc, iStretchMode=4)
{
return DllCall("gdi32\SetStretchBltMode"
, A_PtrSize ? "UPtr" : "UInt", hdc
, "int", iStretchMode)
}
SetImage(hwnd, hBitmap)
{
SendMessage, 0x172, 0x0, hBitmap,, ahk_id %hwnd%
E := ErrorLevel
DeleteObject(E)
return E
}
SetSysColorToControl(hwnd, SysColor=15)
{
WinGetPos,,, w, h, ahk_id %hwnd%
bc := DllCall("GetSysColor", "Int", SysColor, "UInt")
pBrushClear := Gdip_BrushCreateSolid(0xff000000 | (bc >> 16 | bc & 0xff00 | (bc & 0xff) << 16))
pBitmap := Gdip_CreateBitmap(w, h), G := Gdip_GraphicsFromImage(pBitmap)
Gdip_FillRectangle(G, pBrushClear, 0, 0, w, h)
hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
SetImage(hwnd, hBitmap)
Gdip_DeleteBrush(pBrushClear)
Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmap), DeleteObject(hBitmap)
return 0
}
Gdip_BitmapFromScreen(Screen=0, Raster="")
{
	if (Screen = 0)
	{
		Sysget, x, 76
		Sysget, y, 77
		Sysget, w, 78
		Sysget, h, 79
	}
	else if (SubStr(Screen, 1, 5) = "hwnd:")
	{
		Screen := SubStr(Screen, 6)
		if !WinExist( "ahk_id " Screen)
			return -2
		WinGetPos,,, w, h, ahk_id %Screen%
		x := y := 0
		hhdc := GetDCEx(Screen, 3)
	}
	else if (Screen&1 != "")
	{
		Sysget, M, Monitor, %Screen%
		x := MLeft, y := MTop, w := MRight-MLeft, h := MBottom-MTop
	}
	else
	{
		StringSplit, S, Screen, |
		x := S1, y := S2, w := S3, h := S4
	}

	if (x = "") || (y = "") || (w = "") || (h = "")
		return -1

	chdc := CreateCompatibleDC(), hbm := CreateDIBSection(w, h, chdc), obm := SelectObject(chdc, hbm), hhdc := hhdc ? hhdc : GetDC()
	BitBlt(chdc, 0, 0, w, h, hhdc, x, y, Raster)
	ReleaseDC(hhdc)

	pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
	SelectObject(chdc, obm), DeleteObject(hbm), DeleteDC(hhdc), DeleteDC(chdc)
	return pBitmap
}
Gdip_BitmapFromHWND(hwnd)
{
WinGetPos,,, Width, Height, ahk_id %hwnd%
hbm := CreateDIBSection(Width, Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
PrintWindow(hwnd, hdc)
pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
return pBitmap
}
CreateRectF(ByRef RectF, x, y, w, h)
{
VarSetCapacity(RectF, 16)
NumPut(x, RectF, 0, "float"), NumPut(y, RectF, 4, "float"), NumPut(w, RectF, 8, "float"), NumPut(h, RectF, 12, "float")
}
CreateRect(ByRef Rect, x, y, w, h)
{
VarSetCapacity(Rect, 16)
NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
}
CreateSizeF(ByRef SizeF, w, h)
{
VarSetCapacity(SizeF, 8)
NumPut(w, SizeF, 0, "float"), NumPut(h, SizeF, 4, "float")
}
CreatePointF(ByRef PointF, x, y)
{
VarSetCapacity(PointF, 8)
NumPut(x, PointF, 0, "float"), NumPut(y, PointF, 4, "float")
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
hdc2 := hdc ? hdc : GetDC()
VarSetCapacity(bi, 40, 0)
NumPut(w, bi, 4, "uint")
, NumPut(h, bi, 8, "uint")
, NumPut(40, bi, 0, "uint")
, NumPut(1, bi, 12, "ushort")
, NumPut(0, bi, 16, "uInt")
, NumPut(bpp, bi, 14, "ushort")
hbm := DllCall("CreateDIBSection"
, Ptr, hdc2
, Ptr, &bi
, "uint", 0
, A_PtrSize ? "UPtr*" : "uint*", ppvBits
, Ptr, 0
, "uint", 0, Ptr)
if !hdc
ReleaseDC(hdc2)
return hbm
}
PrintWindow(hwnd, hdc, Flags=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("PrintWindow", Ptr, hwnd, Ptr, hdc, "uint", Flags)
}
DestroyIcon(hIcon)
{
return DllCall("DestroyIcon", A_PtrSize ? "UPtr" : "UInt", hIcon)
}
PaintDesktop(hdc)
{
return DllCall("PaintDesktop", A_PtrSize ? "UPtr" : "UInt", hdc)
}
CreateCompatibleBitmap(hdc, w, h)
{
return DllCall("gdi32\CreateCompatibleBitmap", A_PtrSize ? "UPtr" : "UInt", hdc, "int", w, "int", h)
}
CreateCompatibleDC(hdc=0)
{
return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
SelectObject(hdc, hgdiobj)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
}
DeleteObject(hObject)
{
return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
}
GetDC(hwnd=0)
{
return DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", hwnd)
}
GetDCEx(hwnd, flags=0, hrgnClip=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("GetDCEx", Ptr, hwnd, Ptr, hrgnClip, "int", flags)
}
ReleaseDC(hdc, hwnd=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("ReleaseDC", Ptr, hwnd, Ptr, hdc)
}
DeleteDC(hdc)
{
return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
Gdip_LibraryVersion()
{
return 1.45
}
Gdip_LibrarySubVersion()
{
return 1.47
}
Gdip_BitmapFromBRA(ByRef BRAFromMemIn, File, Alternate=0)
{
Static FName = "ObjRelease"
if !BRAFromMemIn
return -1
Loop, Parse, BRAFromMemIn, `n
{
if (A_Index = 1)
{
StringSplit, Header, A_LoopField, |
if (Header0 != 4 || Header2 != "BRA!")
return -2
}
else if (A_Index = 2)
{
StringSplit, Info, A_LoopField, |
if (Info0 != 3)
return -3
}
else
break
}
if !Alternate
StringReplace, File, File, \, \\, All
RegExMatch(BRAFromMemIn, "mi`n)^" (Alternate ? File "\|.+?\|(\d+)\|(\d+)" : "\d+\|" File "\|(\d+)\|(\d+)") "$", FileInfo)
if !FileInfo
return -4
hData := DllCall("GlobalAlloc", "uint", 2, Ptr, FileInfo2, Ptr)
pData := DllCall("GlobalLock", Ptr, hData, Ptr)
DllCall("RtlMoveMemory", Ptr, pData, Ptr, &BRAFromMemIn+Info2+FileInfo1, Ptr, FileInfo2)
DllCall("GlobalUnlock", Ptr, hData)
DllCall("ole32\CreateStreamOnHGlobal", Ptr, hData, "int", 1, A_PtrSize ? "UPtr*" : "UInt*", pStream)
DllCall("gdiplus\GdipCreateBitmapFromStream", Ptr, pStream, A_PtrSize ? "UPtr*" : "UInt*", pBitmap)
If (A_PtrSize)
%FName%(pStream)
Else
DllCall(NumGet(NumGet(1*pStream)+8), "uint", pStream)
return pBitmap
}
Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawRectangle", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawRoundedRectangle(pGraphics, pPen, x, y, w, h, r)
{
Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
E := Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
Gdip_ResetClip(pGraphics)
Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
Gdip_DrawEllipse(pGraphics, pPen, x, y, 2*r, 2*r)
Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y, 2*r, 2*r)
Gdip_DrawEllipse(pGraphics, pPen, x, y+h-(2*r), 2*r, 2*r)
Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
Gdip_ResetClip(pGraphics)
return E
}
Gdip_DrawEllipse(pGraphics, pPen, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawEllipse", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawBezier(pGraphics, pPen, x1, y1, x2, y2, x3, y3, x4, y4)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawBezier"
, Ptr, pgraphics
, Ptr, pPen
, "float", x1
, "float", y1
, "float", x2
, "float", y2
, "float", x3
, "float", y3
, "float", x4
, "float", y4)
}
Gdip_DrawArc(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawArc"
, Ptr, pGraphics
, Ptr, pPen
, "float", x
, "float", y
, "float", w
, "float", h
, "float", StartAngle
, "float", SweepAngle)
}
Gdip_DrawPie(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawPie", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawLine(pGraphics, pPen, x1, y1, x2, y2)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipDrawLine"
, Ptr, pGraphics
, Ptr, pPen
, "float", x1
, "float", y1
, "float", x2
, "float", y2)
}
Gdip_DrawLines(pGraphics, pPen, Points)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
return DllCall("gdiplus\GdipDrawLines", Ptr, pGraphics, Ptr, pPen, Ptr, &PointF, "int", Points0)
}
Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillRectangle"
, Ptr, pGraphics
, Ptr, pBrush
, "float", x
, "float", y
, "float", w
, "float", h)
}
Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r)
{
Region := Gdip_GetClipRegion(pGraphics)
Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
E := Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
Gdip_SetClipRegion(pGraphics, Region, 0)
Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
Gdip_FillEllipse(pGraphics, pBrush, x, y, 2*r, 2*r)
Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y, 2*r, 2*r)
Gdip_FillEllipse(pGraphics, pBrush, x, y+h-(2*r), 2*r, 2*r)
Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
Gdip_SetClipRegion(pGraphics, Region, 0)
Gdip_DeleteRegion(Region)
return E
}
Gdip_FillPolygon(pGraphics, pBrush, Points, FillMode=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
return DllCall("gdiplus\GdipFillPolygon", Ptr, pGraphics, Ptr, pBrush, Ptr, &PointF, "int", Points0, "int", FillMode)
}
Gdip_FillPie(pGraphics, pBrush, x, y, w, h, StartAngle, SweepAngle)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillPie"
, Ptr, pGraphics
, Ptr, pBrush
, "float", x
, "float", y
, "float", w
, "float", h
, "float", StartAngle
, "float", SweepAngle)
}
Gdip_FillEllipse(pGraphics, pBrush, x, y, w, h)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillEllipse", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRegion(pGraphics, pBrush, Region)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillRegion", Ptr, pGraphics, Ptr, pBrush, Ptr, Region)
}
Gdip_FillPath(pGraphics, pBrush, Path)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipFillPath", Ptr, pGraphics, Ptr, pBrush, Ptr, Path)
}
Gdip_DrawImagePointsRect(pGraphics, pBitmap, Points, sx="", sy="", sw="", sh="", Matrix=1)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
if (Matrix&1 = "")
ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
else if (Matrix != 1)
ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
if (sx = "" && sy = "" && sw = "" && sh = "")
{
sx := 0, sy := 0
sw := Gdip_GetImageWidth(pBitmap)
sh := Gdip_GetImageHeight(pBitmap)
}
E := DllCall("gdiplus\GdipDrawImagePointsRect"
, Ptr, pGraphics
, Ptr, pBitmap
, Ptr, &PointF
, "int", Points0
, "float", sx
, "float", sy
, "float", sw
, "float", sh
, "int", 2
, Ptr, ImageAttr
, Ptr, 0
, Ptr, 0)
if ImageAttr
Gdip_DisposeImageAttributes(ImageAttr)
return E
}
Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (Matrix&1 = "")
ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
else if (Matrix != 1)
ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
if (sx = "" && sy = "" && sw = "" && sh = "")
{
if (dx = "" && dy = "" && dw = "" && dh = "")
{
sx := dx := 0, sy := dy := 0
sw := dw := Gdip_GetImageWidth(pBitmap)
sh := dh := Gdip_GetImageHeight(pBitmap)
}
else
{
sx := sy := 0
sw := Gdip_GetImageWidth(pBitmap)
sh := Gdip_GetImageHeight(pBitmap)
}
}
E := DllCall("gdiplus\GdipDrawImageRectRect"
, Ptr, pGraphics
, Ptr, pBitmap
, "float", dx
, "float", dy
, "float", dw
, "float", dh
, "float", sx
, "float", sy
, "float", sw
, "float", sh
, "int", 2
, Ptr, ImageAttr
, Ptr, 0
, Ptr, 0)
if ImageAttr
Gdip_DisposeImageAttributes(ImageAttr)
return E
}
Gdip_SetImageAttributesColorMatrix(Matrix)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
VarSetCapacity(ColourMatrix, 100, 0)
Matrix := RegExReplace(RegExReplace(Matrix, "^[^\d-\.]+([\d\.])", "$1", "", 1), "[^\d-\.]+", "|")
StringSplit, Matrix, Matrix, |
Loop, 25
{
Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
}
DllCall("gdiplus\GdipCreateImageAttributes", A_PtrSize ? "UPtr*" : "uint*", ImageAttr)
DllCall("gdiplus\GdipSetImageAttributesColorMatrix", Ptr, ImageAttr, "int", 1, "int", 1, Ptr, &ColourMatrix, Ptr, 0, "int", 0)
return ImageAttr
}
Gdip_GraphicsFromImage(pBitmap)
{
DllCall("gdiplus\GdipGetImageGraphicsContext", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
return pGraphics
}
Gdip_GraphicsFromHDC(hdc)
{
DllCall("gdiplus\GdipCreateFromHDC", A_PtrSize ? "UPtr" : "UInt", hdc, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
return pGraphics
}
Gdip_GetDC(pGraphics)
{
DllCall("gdiplus\GdipGetDC", A_PtrSize ? "UPtr" : "UInt", pGraphics, A_PtrSize ? "UPtr*" : "UInt*", hdc)
return hdc
}
Gdip_ReleaseDC(pGraphics, hdc)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipReleaseDC", Ptr, pGraphics, Ptr, hdc)
}
Gdip_GraphicsClear(pGraphics, ARGB=0x00ffffff)
{
return DllCall("gdiplus\GdipGraphicsClear", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", ARGB)
}
Gdip_BlurBitmap(pBitmap, Blur)
{
if (Blur > 100) || (Blur < 1)
return -1
sWidth := Gdip_GetImageWidth(pBitmap), sHeight := Gdip_GetImageHeight(pBitmap)
dWidth := sWidth//Blur, dHeight := sHeight//Blur
pBitmap1 := Gdip_CreateBitmap(dWidth, dHeight)
G1 := Gdip_GraphicsFromImage(pBitmap1)
Gdip_SetInterpolationMode(G1, 7)
Gdip_DrawImage(G1, pBitmap, 0, 0, dWidth, dHeight, 0, 0, sWidth, sHeight)
Gdip_DeleteGraphics(G1)
pBitmap2 := Gdip_CreateBitmap(sWidth, sHeight)
G2 := Gdip_GraphicsFromImage(pBitmap2)
Gdip_SetInterpolationMode(G2, 7)
Gdip_DrawImage(G2, pBitmap1, 0, 0, sWidth, sHeight, 0, 0, dWidth, dHeight)
Gdip_DeleteGraphics(G2)
Gdip_DisposeImage(pBitmap1)
return pBitmap2
}
Gdip_SaveBitmapToFile(pBitmap, sOutput, Quality=75)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
SplitPath, sOutput,,, Extension
if Extension not in BMP,DIB,RLE,JPG,JPEG,JPE,JFIF,GIF,TIF,TIFF,PNG
return -1
Extension := "." Extension
DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", nCount, "uint*", nSize)
VarSetCapacity(ci, nSize)
DllCall("gdiplus\GdipGetImageEncoders", "uint", nCount, "uint", nSize, Ptr, &ci)
if !(nCount && nSize)
return -2
If (A_IsUnicode){
StrGet_Name := "StrGet"
Loop, %nCount%
{
sString := %StrGet_Name%(NumGet(ci, (idx := (48+7*A_PtrSize)*(A_Index-1))+32+3*A_PtrSize), "UTF-16")
if !InStr(sString, "*" Extension)
continue
pCodec := &ci+idx
break
}
} else {
Loop, %nCount%
{
Location := NumGet(ci, 76*(A_Index-1)+44)
nSize := DllCall("WideCharToMultiByte", "uint", 0, "uint", 0, "uint", Location, "int", -1, "uint", 0, "int",  0, "uint", 0, "uint", 0)
VarSetCapacity(sString, nSize)
DllCall("WideCharToMultiByte", "uint", 0, "uint", 0, "uint", Location, "int", -1, "str", sString, "int", nSize, "uint", 0, "uint", 0)
if !InStr(sString, "*" Extension)
continue
pCodec := &ci+76*(A_Index-1)
break
}
}
if !pCodec
return -3
if (Quality != 75)
{
Quality := (Quality < 0) ? 0 : (Quality > 100) ? 100 : Quality
if Extension in .JPG,.JPEG,.JPE,.JFIF
{
DllCall("gdiplus\GdipGetEncoderParameterListSize", Ptr, pBitmap, Ptr, pCodec, "uint*", nSize)
VarSetCapacity(EncoderParameters, nSize, 0)
DllCall("gdiplus\GdipGetEncoderParameterList", Ptr, pBitmap, Ptr, pCodec, "uint", nSize, Ptr, &EncoderParameters)
Loop, % NumGet(EncoderParameters, "UInt")
{
elem := (24+(A_PtrSize ? A_PtrSize : 4))*(A_Index-1) + 4 + (pad := A_PtrSize = 8 ? 4 : 0)
if (NumGet(EncoderParameters, elem+16, "UInt") = 1) && (NumGet(EncoderParameters, elem+20, "UInt") = 6)
{
p := elem+&EncoderParameters-pad-4
NumPut(Quality, NumGet(NumPut(4, NumPut(1, p+0)+20, "UInt")), "UInt")
break
}
}
}
}
if (!A_IsUnicode)
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sOutput, "int", -1, Ptr, 0, "int", 0)
VarSetCapacity(wOutput, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sOutput, "int", -1, Ptr, &wOutput, "int", nSize)
VarSetCapacity(wOutput, -1)
if !VarSetCapacity(wOutput)
return -4
E := DllCall("gdiplus\GdipSaveImageToFile", Ptr, pBitmap, Ptr, &wOutput, Ptr, pCodec, "uint", p ? p : 0)
}
else
E := DllCall("gdiplus\GdipSaveImageToFile", Ptr, pBitmap, Ptr, &sOutput, Ptr, pCodec, "uint", p ? p : 0)
return E ? -5 : 0
}
Gdip_GetPixel(pBitmap, x, y)
{
DllCall("gdiplus\GdipBitmapGetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", x, "int", y, "uint*", ARGB)
return ARGB
}
Gdip_SetPixel(pBitmap, x, y, ARGB)
{
return DllCall("gdiplus\GdipBitmapSetPixel", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", x, "int", y, "int", ARGB)
}
Gdip_GetImageWidth(pBitmap)
{
DllCall("gdiplus\GdipGetImageWidth", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Width)
return Width
}
Gdip_GetImageHeight(pBitmap)
{
DllCall("gdiplus\GdipGetImageHeight", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Height)
return Height
}
Gdip_GetImageDimensions(pBitmap, ByRef Width, ByRef Height)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
DllCall("gdiplus\GdipGetImageWidth", Ptr, pBitmap, "uint*", Width)
DllCall("gdiplus\GdipGetImageHeight", Ptr, pBitmap, "uint*", Height)
}
Gdip_GetDimensions(pBitmap, ByRef Width, ByRef Height)
{
Gdip_GetImageDimensions(pBitmap, Width, Height)
}
Gdip_GetImagePixelFormat(pBitmap)
{
DllCall("gdiplus\GdipGetImagePixelFormat", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", Format)
return Format
}
Gdip_GetDpiX(pGraphics)
{
DllCall("gdiplus\GdipGetDpiX", A_PtrSize ? "UPtr" : "uint", pGraphics, "float*", dpix)
return Round(dpix)
}
Gdip_GetDpiY(pGraphics)
{
DllCall("gdiplus\GdipGetDpiY", A_PtrSize ? "UPtr" : "uint", pGraphics, "float*", dpiy)
return Round(dpiy)
}
Gdip_GetImageHorizontalResolution(pBitmap)
{
DllCall("gdiplus\GdipGetImageHorizontalResolution", A_PtrSize ? "UPtr" : "uint", pBitmap, "float*", dpix)
return Round(dpix)
}
Gdip_GetImageVerticalResolution(pBitmap)
{
DllCall("gdiplus\GdipGetImageVerticalResolution", A_PtrSize ? "UPtr" : "uint", pBitmap, "float*", dpiy)
return Round(dpiy)
}
Gdip_BitmapSetResolution(pBitmap, dpix, dpiy)
{
return DllCall("gdiplus\GdipBitmapSetResolution", A_PtrSize ? "UPtr" : "uint", pBitmap, "float", dpix, "float", dpiy)
}
Gdip_CreateBitmapFromFile(sFile, IconNumber=1, IconSize="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
, PtrA := A_PtrSize ? "UPtr*" : "UInt*"
SplitPath, sFile,,, ext
if ext in exe,dll
{
Sizes := IconSize ? IconSize : 256 "|" 128 "|" 64 "|" 48 "|" 32 "|" 16
BufSize := 16 + (2*(A_PtrSize ? A_PtrSize : 4))
VarSetCapacity(buf, BufSize, 0)
Loop, Parse, Sizes, |
{
DllCall("PrivateExtractIcons", "str", sFile, "int", IconNumber-1, "int", A_LoopField, "int", A_LoopField, PtrA, hIcon, PtrA, 0, "uint", 1, "uint", 0)
if !hIcon
continue
if !DllCall("GetIconInfo", Ptr, hIcon, Ptr, &buf)
{
DestroyIcon(hIcon)
continue
}
hbmMask  := NumGet(buf, 12 + ((A_PtrSize ? A_PtrSize : 4) - 4))
hbmColor := NumGet(buf, 12 + ((A_PtrSize ? A_PtrSize : 4) - 4) + (A_PtrSize ? A_PtrSize : 4))
if !(hbmColor && DllCall("GetObject", Ptr, hbmColor, "int", BufSize, Ptr, &buf))
{
DestroyIcon(hIcon)
continue
}
break
}
if !hIcon
return -1
Width := NumGet(buf, 4, "int"), Height := NumGet(buf, 8, "int")
hbm := CreateDIBSection(Width, -Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
if !DllCall("DrawIconEx", Ptr, hdc, "int", 0, "int", 0, Ptr, hIcon, "uint", Width, "uint", Height, "uint", 0, Ptr, 0, "uint", 3)
{
DestroyIcon(hIcon)
return -2
}
VarSetCapacity(dib, 104)
DllCall("GetObject", Ptr, hbm, "int", A_PtrSize = 8 ? 104 : 84, Ptr, &dib)
Stride := NumGet(dib, 12, "Int"), Bits := NumGet(dib, 20 + (A_PtrSize = 8 ? 4 : 0))
DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", Stride, "int", 0x26200A, Ptr, Bits, PtrA, pBitmapOld)
pBitmap := Gdip_CreateBitmap(Width, Height)
G := Gdip_GraphicsFromImage(pBitmap)
, Gdip_DrawImage(G, pBitmapOld, 0, 0, Width, Height, 0, 0, Width, Height)
SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmapOld)
DestroyIcon(hIcon)
}
else
{
if (!A_IsUnicode)
{
VarSetCapacity(wFile, 1024)
DllCall("kernel32\MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sFile, "int", -1, Ptr, &wFile, "int", 512)
DllCall("gdiplus\GdipCreateBitmapFromFile", Ptr, &wFile, PtrA, pBitmap)
}
else
DllCall("gdiplus\GdipCreateBitmapFromFile", Ptr, &sFile, PtrA, pBitmap)
}
return pBitmap
}
Gdip_CreateBitmapFromHBITMAP(hBitmap, Palette=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", Ptr, hBitmap, Ptr, Palette, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
return pBitmap
}
Gdip_CreateHBITMAPFromBitmap(pBitmap, Background=0xffffffff)
{
DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hbm, "int", Background)
return hbm
}
Gdip_CreateBitmapFromHICON(hIcon)
{
DllCall("gdiplus\GdipCreateBitmapFromHICON", A_PtrSize ? "UPtr" : "UInt", hIcon, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
return pBitmap
}
Gdip_CreateHICONFromBitmap(pBitmap)
{
DllCall("gdiplus\GdipCreateHICONFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hIcon)
return hIcon
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A)
{
DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, A_PtrSize ? "UPtr" : "UInt", 0, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
Return pBitmap
}
Gdip_CreateBitmapFromClipboard()
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if !DllCall("OpenClipboard", Ptr, 0)
return -1
if !DllCall("IsClipboardFormatAvailable", "uint", 8)
return -2
if !hBitmap := DllCall("GetClipboardData", "uint", 2, Ptr)
return -3
if !pBitmap := Gdip_CreateBitmapFromHBITMAP(hBitmap)
return -4
if !DllCall("CloseClipboard")
return -5
DeleteObject(hBitmap)
return pBitmap
}
Gdip_SetBitmapToClipboard(pBitmap)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
off1 := A_PtrSize = 8 ? 52 : 44, off2 := A_PtrSize = 8 ? 32 : 24
hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
DllCall("GetObject", Ptr, hBitmap, "int", VarSetCapacity(oi, A_PtrSize = 8 ? 104 : 84, 0), Ptr, &oi)
hdib := DllCall("GlobalAlloc", "uint", 2, Ptr, 40+NumGet(oi, off1, "UInt"), Ptr)
pdib := DllCall("GlobalLock", Ptr, hdib, Ptr)
DllCall("RtlMoveMemory", Ptr, pdib, Ptr, &oi+off2, Ptr, 40)
DllCall("RtlMoveMemory", Ptr, pdib+40, Ptr, NumGet(oi, off2 - (A_PtrSize ? A_PtrSize : 4), Ptr), Ptr, NumGet(oi, off1, "UInt"))
DllCall("GlobalUnlock", Ptr, hdib)
DllCall("DeleteObject", Ptr, hBitmap)
DllCall("OpenClipboard", Ptr, 0)
DllCall("EmptyClipboard")
DllCall("SetClipboardData", "uint", 8, Ptr, hdib)
DllCall("CloseClipboard")
}
Gdip_CloneBitmapArea(pBitmap, x, y, w, h, Format=0x26200A)
{
DllCall("gdiplus\GdipCloneBitmapArea"
, "float", x
, "float", y
, "float", w
, "float", h
, "int", Format
, A_PtrSize ? "UPtr" : "UInt", pBitmap
, A_PtrSize ? "UPtr*" : "UInt*", pBitmapDest)
return pBitmapDest
}
Gdip_CreatePen(ARGB, w)
{
DllCall("gdiplus\GdipCreatePen1", "UInt", ARGB, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
return pPen
}
Gdip_CreatePenFromBrush(pBrush, w)
{
DllCall("gdiplus\GdipCreatePen2", A_PtrSize ? "UPtr" : "UInt", pBrush, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
return pPen
}
Gdip_BrushCreateSolid(ARGB=0xff000000)
{
DllCall("gdiplus\GdipCreateSolidFill", "UInt", ARGB, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
return pBrush
}
Gdip_BrushCreateHatch(ARGBfront, ARGBback, HatchStyle=0)
{
DllCall("gdiplus\GdipCreateHatchBrush", "int", HatchStyle, "UInt", ARGBfront, "UInt", ARGBback, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
return pBrush
}
Gdip_CreateTextureBrush(pBitmap, WrapMode=1, x=0, y=0, w="", h="")
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
, PtrA := A_PtrSize ? "UPtr*" : "UInt*"
if !(w && h)
DllCall("gdiplus\GdipCreateTexture", Ptr, pBitmap, "int", WrapMode, PtrA, pBrush)
else
DllCall("gdiplus\GdipCreateTexture2", Ptr, pBitmap, "int", WrapMode, "float", x, "float", y, "float", w, "float", h, PtrA, pBrush)
return pBrush
}
Gdip_CreateLineBrush(x1, y1, x2, y2, ARGB1, ARGB2, WrapMode=1)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
CreatePointF(PointF1, x1, y1), CreatePointF(PointF2, x2, y2)
DllCall("gdiplus\GdipCreateLineBrush", Ptr, &PointF1, Ptr, &PointF2, "Uint", ARGB1, "Uint", ARGB2, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
return LGpBrush
}
Gdip_CreateLineBrushFromRect(x, y, w, h, ARGB1, ARGB2, LinearGradientMode=1, WrapMode=1)
{
CreateRectF(RectF, x, y, w, h)
DllCall("gdiplus\GdipCreateLineBrushFromRect", A_PtrSize ? "UPtr" : "UInt", &RectF, "int", ARGB1, "int", ARGB2, "int", LinearGradientMode, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
return LGpBrush
}
Gdip_CloneBrush(pBrush)
{
DllCall("gdiplus\GdipCloneBrush", A_PtrSize ? "UPtr" : "UInt", pBrush, A_PtrSize ? "UPtr*" : "UInt*", pBrushClone)
return pBrushClone
}
Gdip_DeletePen(pPen)
{
return DllCall("gdiplus\GdipDeletePen", A_PtrSize ? "UPtr" : "UInt", pPen)
}
Gdip_DeleteBrush(pBrush)
{
return DllCall("gdiplus\GdipDeleteBrush", A_PtrSize ? "UPtr" : "UInt", pBrush)
}
Gdip_DisposeImage(pBitmap)
{
return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_DeleteGraphics(pGraphics)
{
return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr)
{
return DllCall("gdiplus\GdipDisposeImageAttributes", A_PtrSize ? "UPtr" : "UInt", ImageAttr)
}
Gdip_DeleteFont(hFont)
{
return DllCall("gdiplus\GdipDeleteFont", A_PtrSize ? "UPtr" : "UInt", hFont)
}
Gdip_DeleteStringFormat(hFormat)
{
return DllCall("gdiplus\GdipDeleteStringFormat", A_PtrSize ? "UPtr" : "UInt", hFormat)
}
Gdip_DeleteFontFamily(hFamily)
{
return DllCall("gdiplus\GdipDeleteFontFamily", A_PtrSize ? "UPtr" : "UInt", hFamily)
}
Gdip_DeleteMatrix(Matrix)
{
return DllCall("gdiplus\GdipDeleteMatrix", A_PtrSize ? "UPtr" : "UInt", Matrix)
}
Gdip_TextToGraphics(pGraphics, Text, Options, Font="Arial", Width="", Height="", Measure=0)
{
IWidth := Width, IHeight:= Height
RegExMatch(Options, "i)X([\-\d\.]+)(p*)", xpos)
RegExMatch(Options, "i)Y([\-\d\.]+)(p*)", ypos)
RegExMatch(Options, "i)W([\-\d\.]+)(p*)", Width)
RegExMatch(Options, "i)H([\-\d\.]+)(p*)", Height)
RegExMatch(Options, "i)C(?!(entre|enter))([a-f\d]+)", Colour)
RegExMatch(Options, "i)Top|Up|Bottom|Down|vCentre|vCenter", vPos)
RegExMatch(Options, "i)NoWrap", NoWrap)
RegExMatch(Options, "i)R(\d)", Rendering)
RegExMatch(Options, "i)S(\d+)(p*)", Size)
if !Gdip_DeleteBrush(Gdip_CloneBrush(Colour2))
PassBrush := 1, pBrush := Colour2
if !(IWidth && IHeight) && (xpos2 || ypos2 || Width2 || Height2 || Size2)
return -1
Style := 0, Styles := "Regular|Bold|Italic|BoldItalic|Underline|Strikeout"
Loop, Parse, Styles, |
{
if RegExMatch(Options, "\b" A_loopField)
Style |= (A_LoopField != "StrikeOut") ? (A_Index-1) : 8
}
Align := 0, Alignments := "Near|Left|Centre|Center|Far|Right"
Loop, Parse, Alignments, |
{
if RegExMatch(Options, "\b" A_loopField)
Align |= A_Index//2.1
}
xpos := (xpos1 != "") ? xpos2 ? IWidth*(xpos1/100) : xpos1 : 0
ypos := (ypos1 != "") ? ypos2 ? IHeight*(ypos1/100) : ypos1 : 0
Width := Width1 ? Width2 ? IWidth*(Width1/100) : Width1 : IWidth
Height := Height1 ? Height2 ? IHeight*(Height1/100) : Height1 : IHeight
if !PassBrush
Colour := "0x" (Colour2 ? Colour2 : "ff000000")
Rendering := ((Rendering1 >= 0) && (Rendering1 <= 5)) ? Rendering1 : 4
Size := (Size1 > 0) ? Size2 ? IHeight*(Size1/100) : Size1 : 12
hFamily := Gdip_FontFamilyCreate(Font)
hFont := Gdip_FontCreate(hFamily, Size, Style)
FormatStyle := NoWrap ? 0x4000 | 0x1000 : 0x4000
hFormat := Gdip_StringFormatCreate(FormatStyle)
pBrush := PassBrush ? pBrush : Gdip_BrushCreateSolid(Colour)
if !(hFamily && hFont && hFormat && pBrush && pGraphics)
return !pGraphics ? -2 : !hFamily ? -3 : !hFont ? -4 : !hFormat ? -5 : !pBrush ? -6 : 0
CreateRectF(RC, xpos, ypos, Width, Height)
Gdip_SetStringFormatAlign(hFormat, Align)
Gdip_SetTextRenderingHint(pGraphics, Rendering)
ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
if vPos
{
StringSplit, ReturnRC, ReturnRC, |
if (vPos = "vCentre") || (vPos = "vCenter")
ypos += (Height-ReturnRC4)//2
else if (vPos = "Top") || (vPos = "Up")
ypos := 0
else if (vPos = "Bottom") || (vPos = "Down")
ypos := Height-ReturnRC4
CreateRectF(RC, xpos, ypos, Width, ReturnRC4)
ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
}
if !Measure
E := Gdip_DrawString(pGraphics, Text, hFont, hFormat, pBrush, RC)
if !PassBrush
Gdip_DeleteBrush(pBrush)
Gdip_DeleteStringFormat(hFormat)
Gdip_DeleteFont(hFont)
Gdip_DeleteFontFamily(hFamily)
return E ? E : ReturnRC
}
Gdip_DrawString(pGraphics, sString, hFont, hFormat, pBrush, ByRef RectF)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (!A_IsUnicode)
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, 0, "int", 0)
VarSetCapacity(wString, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
}
return DllCall("gdiplus\GdipDrawString"
, Ptr, pGraphics
, Ptr, A_IsUnicode ? &sString : &wString
, "int", -1
, Ptr, hFont
, Ptr, &RectF
, Ptr, hFormat
, Ptr, pBrush)
}
Gdip_MeasureString(pGraphics, sString, hFont, hFormat, ByRef RectF)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
VarSetCapacity(RC, 16)
if !A_IsUnicode
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, "uint", 0, "int", 0)
VarSetCapacity(wString, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
}
DllCall("gdiplus\GdipMeasureString"
, Ptr, pGraphics
, Ptr, A_IsUnicode ? &sString : &wString
, "int", -1
, Ptr, hFont
, Ptr, &RectF
, Ptr, hFormat
, Ptr, &RC
, "uint*", Chars
, "uint*", Lines)
return &RC ? NumGet(RC, 0, "float") "|" NumGet(RC, 4, "float") "|" NumGet(RC, 8, "float") "|" NumGet(RC, 12, "float") "|" Chars "|" Lines : 0
}
Gdip_SetStringFormatAlign(hFormat, Align)
{
return DllCall("gdiplus\GdipSetStringFormatAlign", A_PtrSize ? "UPtr" : "UInt", hFormat, "int", Align)
}
Gdip_StringFormatCreate(Format=0, Lang=0)
{
DllCall("gdiplus\GdipCreateStringFormat", "int", Format, "int", Lang, A_PtrSize ? "UPtr*" : "UInt*", hFormat)
return hFormat
}
Gdip_FontCreate(hFamily, Size, Style=0)
{
DllCall("gdiplus\GdipCreateFont", A_PtrSize ? "UPtr" : "UInt", hFamily, "float", Size, "int", Style, "int", 0, A_PtrSize ? "UPtr*" : "UInt*", hFont)
return hFont
}
Gdip_FontFamilyCreate(Font)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (!A_IsUnicode)
{
nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, "uint", 0, "int", 0)
VarSetCapacity(wFont, nSize*2)
DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, Ptr, &wFont, "int", nSize)
}
DllCall("gdiplus\GdipCreateFontFamilyFromName"
, Ptr, A_IsUnicode ? &Font : &wFont
, "uint", 0
, A_PtrSize ? "UPtr*" : "UInt*", hFamily)
return hFamily
}
Gdip_CreateAffineMatrix(m11, m12, m21, m22, x, y)
{
DllCall("gdiplus\GdipCreateMatrix2", "float", m11, "float", m12, "float", m21, "float", m22, "float", x, "float", y, A_PtrSize ? "UPtr*" : "UInt*", Matrix)
return Matrix
}
Gdip_CreateMatrix()
{
DllCall("gdiplus\GdipCreateMatrix", A_PtrSize ? "UPtr*" : "UInt*", Matrix)
return Matrix
}
Gdip_CreatePath(BrushMode=0)
{
DllCall("gdiplus\GdipCreatePath", "int", BrushMode, A_PtrSize ? "UPtr*" : "UInt*", Path)
return Path
}
Gdip_AddPathEllipse(Path, x, y, w, h)
{
return DllCall("gdiplus\GdipAddPathEllipse", A_PtrSize ? "UPtr" : "UInt", Path, "float", x, "float", y, "float", w, "float", h)
}
Gdip_AddPathPolygon(Path, Points)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
StringSplit, Points, Points, |
VarSetCapacity(PointF, 8*Points0)
Loop, %Points0%
{
StringSplit, Coord, Points%A_Index%, `,
NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
}
return DllCall("gdiplus\GdipAddPathPolygon", Ptr, Path, Ptr, &PointF, "int", Points0)
}
Gdip_DeletePath(Path)
{
return DllCall("gdiplus\GdipDeletePath", A_PtrSize ? "UPtr" : "UInt", Path)
}
Gdip_SetTextRenderingHint(pGraphics, RenderingHint)
{
return DllCall("gdiplus\GdipSetTextRenderingHint", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", RenderingHint)
}
Gdip_SetInterpolationMode(pGraphics, InterpolationMode)
{
return DllCall("gdiplus\GdipSetInterpolationMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", InterpolationMode)
}
Gdip_SetSmoothingMode(pGraphics, SmoothingMode)
{
return DllCall("gdiplus\GdipSetSmoothingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", SmoothingMode)
}
Gdip_SetCompositingMode(pGraphics, CompositingMode=0)
{
return DllCall("gdiplus\GdipSetCompositingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", CompositingMode)
}
Gdip_Startup()
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
DllCall("LoadLibrary", "str", "gdiplus")
VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
return pToken
}
Gdip_Shutdown(pToken)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
DllCall("gdiplus\GdiplusShutdown", Ptr, pToken)
if hModule := DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
DllCall("FreeLibrary", Ptr, hModule)
return 0
}
Gdip_RotateWorldTransform(pGraphics, Angle, MatrixOrder=0)
{
return DllCall("gdiplus\GdipRotateWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", Angle, "int", MatrixOrder)
}
Gdip_ScaleWorldTransform(pGraphics, x, y, MatrixOrder=0)
{
return DllCall("gdiplus\GdipScaleWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "int", MatrixOrder)
}
Gdip_TranslateWorldTransform(pGraphics, x, y, MatrixOrder=0)
{
return DllCall("gdiplus\GdipTranslateWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "int", MatrixOrder)
}
Gdip_ResetWorldTransform(pGraphics)
{
return DllCall("gdiplus\GdipResetWorldTransform", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_GetRotatedTranslation(Width, Height, Angle, ByRef xTranslation, ByRef yTranslation)
{
pi := 3.14159, TAngle := Angle*(pi/180)
Bound := (Angle >= 0) ? Mod(Angle, 360) : 360-Mod(-Angle, -360)
if ((Bound >= 0) && (Bound <= 90))
xTranslation := Height*Sin(TAngle), yTranslation := 0
else if ((Bound > 90) && (Bound <= 180))
xTranslation := (Height*Sin(TAngle))-(Width*Cos(TAngle)), yTranslation := -Height*Cos(TAngle)
else if ((Bound > 180) && (Bound <= 270))
xTranslation := -(Width*Cos(TAngle)), yTranslation := -(Height*Cos(TAngle))-(Width*Sin(TAngle))
else if ((Bound > 270) && (Bound <= 360))
xTranslation := 0, yTranslation := -Width*Sin(TAngle)
}
Gdip_GetRotatedDimensions(Width, Height, Angle, ByRef RWidth, ByRef RHeight)
{
pi := 3.14159, TAngle := Angle*(pi/180)
if !(Width && Height)
return -1
RWidth := Ceil(Abs(Width*Cos(TAngle))+Abs(Height*Sin(TAngle)))
RHeight := Ceil(Abs(Width*Sin(TAngle))+Abs(Height*Cos(Tangle)))
}
Gdip_ImageRotateFlip(pBitmap, RotateFlipType=1)
{
return DllCall("gdiplus\GdipImageRotateFlip", A_PtrSize ? "UPtr" : "UInt", pBitmap, "int", RotateFlipType)
}
Gdip_SetClipRect(pGraphics, x, y, w, h, CombineMode=0)
{
return DllCall("gdiplus\GdipSetClipRect",  A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "float", w, "float", h, "int", CombineMode)
}
Gdip_SetClipPath(pGraphics, Path, CombineMode=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipSetClipPath", Ptr, pGraphics, Ptr, Path, "int", CombineMode)
}
Gdip_ResetClip(pGraphics)
{
return DllCall("gdiplus\GdipResetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_GetClipRegion(pGraphics)
{
Region := Gdip_CreateRegion()
DllCall("gdiplus\GdipGetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics, "UInt*", Region)
return Region
}
Gdip_SetClipRegion(pGraphics, Region, CombineMode=0)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("gdiplus\GdipSetClipRegion", Ptr, pGraphics, Ptr, Region, "int", CombineMode)
}
Gdip_CreateRegion()
{
DllCall("gdiplus\GdipCreateRegion", "UInt*", Region)
return Region
}
Gdip_DeleteRegion(Region)
{
return DllCall("gdiplus\GdipDeleteRegion", A_PtrSize ? "UPtr" : "UInt", Region)
}
Gdip_LockBits(pBitmap, x, y, w, h, ByRef Stride, ByRef Scan0, ByRef BitmapData, LockMode = 3, PixelFormat = 0x26200a)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
CreateRect(Rect, x, y, w, h)
VarSetCapacity(BitmapData, 16+2*(A_PtrSize ? A_PtrSize : 4), 0)
E := DllCall("Gdiplus\GdipBitmapLockBits", Ptr, pBitmap, Ptr, &Rect, "uint", LockMode, "int", PixelFormat, Ptr, &BitmapData)
Stride := NumGet(BitmapData, 8, "Int")
Scan0 := NumGet(BitmapData, 16, Ptr)
return E
}
Gdip_UnlockBits(pBitmap, ByRef BitmapData)
{
Ptr := A_PtrSize ? "UPtr" : "UInt"
return DllCall("Gdiplus\GdipBitmapUnlockBits", Ptr, pBitmap, Ptr, &BitmapData)
}
Gdip_SetLockBitPixel(ARGB, Scan0, x, y, Stride)
{
Numput(ARGB, Scan0+0, (x*4)+(y*Stride), "UInt")
}
Gdip_GetLockBitPixel(Scan0, x, y, Stride)
{
return NumGet(Scan0+0, (x*4)+(y*Stride), "UInt")
}
Gdip_PixelateBitmap(pBitmap, ByRef pBitmapOut, BlockSize)
{
static PixelateBitmap
Ptr := A_PtrSize ? "UPtr" : "UInt"
if (!PixelateBitmap)
{
if A_PtrSize != 8
MCode_PixelateBitmap =
		(LTrim Join
		558BEC83EC3C8B4514538B5D1C99F7FB56578BC88955EC894DD885C90F8E830200008B451099F7FB8365DC008365E000894DC88955F08945E833FF897DD4
		397DE80F8E160100008BCB0FAFCB894DCC33C08945F88945FC89451C8945143BD87E608B45088D50028BC82BCA8BF02BF2418945F48B45E02955F4894DC4
		8D0CB80FAFCB03CA895DD08BD1895DE40FB64416030145140FB60201451C8B45C40FB604100145FC8B45F40FB604020145F883C204FF4DE475D6034D18FF
		4DD075C98B4DCC8B451499F7F98945148B451C99F7F989451C8B45FC99F7F98945FC8B45F899F7F98945F885DB7E648B450C8D50028BC82BCA83C103894D
		C48BC82BCA41894DF48B4DD48945E48B45E02955E48D0C880FAFCB03CA895DD08BD18BF38A45148B7DC48804178A451C8B7DF488028A45FC8804178A45F8
		8B7DE488043A83C2044E75DA034D18FF4DD075CE8B4DCC8B7DD447897DD43B7DE80F8CF2FEFFFF837DF0000F842C01000033C08945F88945FC89451C8945
		148945E43BD87E65837DF0007E578B4DDC034DE48B75E80FAF4D180FAFF38B45088D500203CA8D0CB18BF08BF88945F48B45F02BF22BFA2955F48945CC0F
		B6440E030145140FB60101451C0FB6440F010145FC8B45F40FB604010145F883C104FF4DCC75D8FF45E4395DE47C9B8B4DF00FAFCB85C9740B8B451499F7
		F9894514EB048365140033F63BCE740B8B451C99F7F989451CEB0389751C3BCE740B8B45FC99F7F98945FCEB038975FC3BCE740B8B45F899F7F98945F8EB
		038975F88975E43BDE7E5A837DF0007E4C8B4DDC034DE48B75E80FAF4D180FAFF38B450C8D500203CA8D0CB18BF08BF82BF22BFA2BC28B55F08955CC8A55
		1488540E038A551C88118A55FC88540F018A55F888140183C104FF4DCC75DFFF45E4395DE47CA68B45180145E0015DDCFF4DC80F8594FDFFFF8B451099F7
		FB8955F08945E885C00F8E450100008B45EC0FAFC38365DC008945D48B45E88945CC33C08945F88945FC89451C8945148945103945EC7E6085DB7E518B4D
		D88B45080FAFCB034D108D50020FAF4D18034DDC8BF08BF88945F403CA2BF22BFA2955F4895DC80FB6440E030145140FB60101451C0FB6440F010145FC8B
		45F40FB604080145F883C104FF4DC875D8FF45108B45103B45EC7CA08B4DD485C9740B8B451499F7F9894514EB048365140033F63BCE740B8B451C99F7F9
		89451CEB0389751C3BCE740B8B45FC99F7F98945FCEB038975FC3BCE740B8B45F899F7F98945F8EB038975F88975103975EC7E5585DB7E468B4DD88B450C
		0FAFCB034D108D50020FAF4D18034DDC8BF08BF803CA2BF22BFA2BC2895DC88A551488540E038A551C88118A55FC88540F018A55F888140183C104FF4DC8
		75DFFF45108B45103B45EC7CAB8BC3C1E0020145DCFF4DCC0F85CEFEFFFF8B4DEC33C08945F88945FC89451C8945148945103BC87E6C3945F07E5C8B4DD8
		8B75E80FAFCB034D100FAFF30FAF4D188B45088D500203CA8D0CB18BF08BF88945F48B45F02BF22BFA2955F48945C80FB6440E030145140FB60101451C0F
		B6440F010145FC8B45F40FB604010145F883C104FF4DC875D833C0FF45108B4DEC394D107C940FAF4DF03BC874068B451499F7F933F68945143BCE740B8B
		451C99F7F989451CEB0389751C3BCE740B8B45FC99F7F98945FCEB038975FC3BCE740B8B45F899F7F98945F8EB038975F88975083975EC7E63EB0233F639
		75F07E4F8B4DD88B75E80FAFCB034D080FAFF30FAF4D188B450C8D500203CA8D0CB18BF08BF82BF22BFA2BC28B55F08955108A551488540E038A551C8811
		8A55FC88540F018A55F888140883C104FF4D1075DFFF45088B45083B45EC7C9F5F5E33C05BC9C21800
)
else
MCode_PixelateBitmap =
		(LTrim Join
		4489442418488954241048894C24085355565741544155415641574883EC28418BC1448B8C24980000004C8BDA99488BD941F7F9448BD0448BFA8954240C
		448994248800000085C00F8E9D020000418BC04533E4458BF299448924244C8954241041F7F933C9898C24980000008BEA89542404448BE889442408EB05
		4C8B5C24784585ED0F8E1A010000458BF1418BFD48897C2418450FAFF14533D233F633ED4533E44533ED4585C97E5B4C63BC2490000000418D040A410FAF
		C148984C8D441802498BD9498BD04D8BD90FB642010FB64AFF4403E80FB60203E90FB64AFE4883C2044403E003F149FFCB75DE4D03C748FFCB75D0488B7C
		24188B8C24980000004C8B5C2478418BC59941F7FE448BE8418BC49941F7FE448BE08BC59941F7FE8BE88BC69941F7FE8BF04585C97E4048639C24900000
		004103CA4D8BC1410FAFC94863C94A8D541902488BCA498BC144886901448821408869FF408871FE4883C10448FFC875E84803D349FFC875DA8B8C249800
		0000488B5C24704C8B5C24784183C20448FFCF48897C24180F850AFFFFFF8B6C2404448B2424448B6C24084C8B74241085ED0F840A01000033FF33DB4533
		DB4533D24533C04585C97E53488B74247085ED7E42438D0C04418BC50FAF8C2490000000410FAFC18D04814863C8488D5431028BCD0FB642014403D00FB6
		024883C2044403D80FB642FB03D80FB642FA03F848FFC975DE41FFC0453BC17CB28BCD410FAFC985C9740A418BC299F7F98BF0EB0233F685C9740B418BC3
		99F7F9448BD8EB034533DB85C9740A8BC399F7F9448BD0EB034533D285C9740A8BC799F7F9448BC0EB034533C033D24585C97E4D4C8B74247885ED7E3841
		8D0C14418BC50FAF8C2490000000410FAFC18D04814863C84A8D4431028BCD40887001448818448850FF448840FE4883C00448FFC975E8FFC2413BD17CBD
		4C8B7424108B8C2498000000038C2490000000488B5C24704503E149FFCE44892424898C24980000004C897424100F859EFDFFFF448B7C240C448B842480
		000000418BC09941F7F98BE8448BEA89942498000000896C240C85C00F8E3B010000448BAC2488000000418BCF448BF5410FAFC9898C248000000033FF33
		ED33F64533DB4533D24533C04585FF7E524585C97E40418BC5410FAFC14103C00FAF84249000000003C74898488D541802498BD90FB642014403D00FB602
		4883C2044403D80FB642FB03F00FB642FA03E848FFCB75DE488B5C247041FFC0453BC77CAE85C9740B418BC299F7F9448BE0EB034533E485C9740A418BC3
		99F7F98BD8EB0233DB85C9740A8BC699F7F9448BD8EB034533DB85C9740A8BC599F7F9448BD0EB034533D24533C04585FF7E4E488B4C24784585C97E3541
		8BC5410FAFC14103C00FAF84249000000003C74898488D540802498BC144886201881A44885AFF448852FE4883C20448FFC875E941FFC0453BC77CBE8B8C
		2480000000488B5C2470418BC1C1E00203F849FFCE0F85ECFEFFFF448BAC24980000008B6C240C448BA4248800000033FF33DB4533DB4533D24533C04585
		FF7E5A488B7424704585ED7E48418BCC8BC5410FAFC94103C80FAF8C2490000000410FAFC18D04814863C8488D543102418BCD0FB642014403D00FB60248
		83C2044403D80FB642FB03D80FB642FA03F848FFC975DE41FFC0453BC77CAB418BCF410FAFCD85C9740A418BC299F7F98BF0EB0233F685C9740B418BC399
		F7F9448BD8EB034533DB85C9740A8BC399F7F9448BD0EB034533D285C9740A8BC799F7F9448BC0EB034533C033D24585FF7E4E4585ED7E42418BCC8BC541
		0FAFC903CA0FAF8C2490000000410FAFC18D04814863C8488B442478488D440102418BCD40887001448818448850FF448840FE4883C00448FFC975E8FFC2
		413BD77CB233C04883C428415F415E415D415C5F5E5D5BC3
)
VarSetCapacity(PixelateBitmap, StrLen(MCode_PixelateBitmap)//2)
Loop % StrLen(MCode_PixelateBitmap)//2
NumPut("0x" SubStr(MCode_PixelateBitmap, (2*A_Index)-1, 2), PixelateBitmap, A_Index-1, "UChar")
DllCall("VirtualProtect", Ptr, &PixelateBitmap, Ptr, VarSetCapacity(PixelateBitmap), "uint", 0x40, A_PtrSize ? "UPtr*" : "UInt*", 0)
}
Gdip_GetImageDimensions(pBitmap, Width, Height)
if (Width != Gdip_GetImageWidth(pBitmapOut) || Height != Gdip_GetImageHeight(pBitmapOut))
return -1
if (BlockSize > Width || BlockSize > Height)
return -2
E1 := Gdip_LockBits(pBitmap, 0, 0, Width, Height, Stride1, Scan01, BitmapData1)
E2 := Gdip_LockBits(pBitmapOut, 0, 0, Width, Height, Stride2, Scan02, BitmapData2)
if (E1 || E2)
return -3
E := DllCall(&PixelateBitmap, Ptr, Scan01, Ptr, Scan02, "int", Width, "int", Height, "int", Stride1, "int", BlockSize)
Gdip_UnlockBits(pBitmap, BitmapData1), Gdip_UnlockBits(pBitmapOut, BitmapData2)
return 0
}
Gdip_ToARGB(A, R, G, B)
{
return (A << 24) | (R << 16) | (G << 8) | B
}
Gdip_FromARGB(ARGB, ByRef A, ByRef R, ByRef G, ByRef B)
{
A := (0xff000000 & ARGB) >> 24
R := (0x00ff0000 & ARGB) >> 16
G := (0x0000ff00 & ARGB) >> 8
B := 0x000000ff & ARGB
}
Gdip_AFromARGB(ARGB)
{
return (0xff000000 & ARGB) >> 24
}
Gdip_RFromARGB(ARGB)
{
return (0x00ff0000 & ARGB) >> 16
}
Gdip_GFromARGB(ARGB)
{
return (0x0000ff00 & ARGB) >> 8
}
Gdip_BFromARGB(ARGB)
{
return 0x000000ff & ARGB
}
StrGetB(Address, Length=-1, Encoding=0)
{
if Length is not integer
Encoding := Length,  Length := -1
if (Address+0 < 1024)
return
if Encoding = UTF-16
Encoding = 1200
else if Encoding = UTF-8
Encoding = 65001
else if SubStr(Encoding,1,2)="CP"
Encoding := SubStr(Encoding,3)
if !Encoding
{
if (Length == -1)
Length := DllCall("lstrlen", "uint", Address)
VarSetCapacity(String, Length)
DllCall("lstrcpyn", "str", String, "uint", Address, "int", Length + 1)
}
else if Encoding = 1200
{
char_count := DllCall("WideCharToMultiByte", "uint", 0, "uint", 0x400, "uint", Address, "int", Length, "uint", 0, "uint", 0, "uint", 0, "uint", 0)
VarSetCapacity(String, char_count)
DllCall("WideCharToMultiByte", "uint", 0, "uint", 0x400, "uint", Address, "int", Length, "str", String, "int", char_count, "uint", 0, "uint", 0)
}
else if Encoding is integer
{
char_count := DllCall("MultiByteToWideChar", "uint", Encoding, "uint", 0, "uint", Address, "int", Length, "uint", 0, "int", 0)
VarSetCapacity(String, char_count * 2)
char_count := DllCall("MultiByteToWideChar", "uint", Encoding, "uint", 0, "uint", Address, "int", Length, "uint", &String, "int", char_count * 2)
String := StrGetB(&String, char_count, 1200)
}
return String
}