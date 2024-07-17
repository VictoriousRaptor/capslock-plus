; 1. Include the .ahk file(s) containing custom key functions here,
;   or just put the functions here.
;   * A key function must start with "keyFunc_" (case insensitive)

; 2. Add a setting under the [Keys] section in `CapsLock+settings.ini`

; Example:
; 1. There is a key function `keyFunc_example2` in demo.ahk.
; 2. Add below setting under the [Keys] section in `CapsLock+settings.ini`:
;   caps_f7=keyFunc_example2
; 3. Save, reload Capslock+ (CapsLock+F5)
; 4. Press `CapsLock+F7` to invoke the function

#include ime_lib.ahk

; 微软拼音: 1 中文+英文标点 0 英文 1025 中文+中文标点
; Weasel 1中文 0英文
keyFunc_insertQuotes(){
    mode := IME_GetConvMode()
    if (mode & 1) {
        keyFunc_doubleChar("“","”")
    }
    Else {
        keyFunc_doubleChar("""")
    }
    Return
}

keyFunc_insertParen(){
    mode := IME_GetConvMode()
    if (mode & 1) {
        keyFunc_doubleChar("（","）")
    }
    Else {
        keyFunc_doubleChar("(",")")
    }
    Return
}

keyFunc_insertBrackets(){
    mode := IME_GetConvMode()
    if (mode & 1) {
        keyFunc_doubleChar("【","】")
    }
    else {
        keyFunc_doubleChar("[","]")
    }
    Return
}

keyFunc_ctrlAltV(){
    SendInput, ^!v
    SendInput, {CtrlUp}
    SendInput, {AltUp}
    Return
}
