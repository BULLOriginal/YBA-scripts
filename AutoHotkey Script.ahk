; AHK script to click left mouse button infinitely when holding LMB
; Toggle the script with the "M" key

#Persistent
toggle := 0
SetTimer, FastClick, 1 ; Update timer interval to 1 ms for a faster response

M::
    toggle := !toggle
    if (toggle) {
        TrayTip, LMB Clicker, Enabled, 1
    } else {
        TrayTip, LMB Clicker, Disabled, 1
    }
return

FastClick:
    if (toggle && GetKeyState("LButton", "P")) {
        Loop {
            Click
            Sleep, 200 ; Sleep for 200 ms, which corresponds to 5 clicks per second
        }
    }
return