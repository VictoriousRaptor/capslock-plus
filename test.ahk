#Requires AutoHotkey v1

; 微软拼音
; 中文+英文标点 1
; 英文 0
; 中文+中文标点 1025
IME_GetConvMode(WinTitle="A")
{
    hwnd :=GetGUIThreadInfo_hwndActive(WinTitle)
    return DllCall("SendMessage"
          , "Ptr", DllCall("imm32\ImmGetDefaultIMEWnd", "Ptr", hwnd)
          , "UInt", 0x0283  ;Message : WM_IME_CONTROL
          ,  "Int", 0x001   ;wParam  : IMC_GETCONVERSIONMODE
          ,  "Int", 0) & 0xffff     ;lParam  : 0 ， & 0xffff 表示只取低16位
}

GetGUIThreadInfo_hwndActive(WinTitle="A")
{
    ControlGet, hwnd, HWND,,, %WinTitle%
    if (WinActive(WinTitle)) {
        ptrSize := !A_PtrSize ? 4 : A_PtrSize
        VarSetCapacity(stGTI, cbSize:=4+4+(PtrSize*6)+16, 0)
        NumPut(cbSize, stGTI,  0, "UInt")
        return hwnd := DllCall("GetGUIThreadInfo", "Uint", 0, "Ptr", &stGTI)
        ? NumGet(stGTI, 8+PtrSize, "Ptr") : hwnd
    }
    else {
        return hwnd
    }
}

#+b::
MsgBox % IME_GetConvMode()

