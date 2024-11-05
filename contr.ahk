contr(){
	while(1<2){
	a := GetKeyState(Lbutton,P)
	tooltip, %a%
		while (a = 1){
			a := GetKeyState(LButton,P)
			k := time_ms()
			;SendPlay, {m down}
			;sleep, 10
			;SendPlay, {m up}
			tooltip, %a% %k%
		}
	}
}