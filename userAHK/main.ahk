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

keyFunc_insertQuotes(){
    mode := IME_GetConvMode()
    if (mode == 0 || mode == 1) {
        keyFunc_doubleChar("""")
    }
    else if (mode == 1025) {
        keyFunc_doubleChar("“","”")
    }
}

keyFunc_insertParen(){
    mode := IME_GetConvMode()
    if (mode == 0 || mode == 1) {
        keyFunc_doubleChar("(",")")
    }
    else if (mode == 1025) {
        keyFunc_doubleChar("（","）")
    }
}

keyFunc_insertBrackets(){
    mode := IME_GetConvMode()
    if (mode == 0 || mode == 1) {
        keyFunc_doubleChar("[","]")
    }
    else if (mode == 1025) {
        keyFunc_doubleChar("【","】")
    }
}

keyFunc_ctrlAltV(){
    Send, ^!v
}
