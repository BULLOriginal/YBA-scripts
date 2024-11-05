global time_punch := time_ms()
global last_punch
;c::kick()
;v::eye()
;~Lbutton::punch()

punch(){
sleep, -1
last_punch := time_ms()
sleep, -1
;aToolTip, %last_punch%
}


kick(){
	while (time_ms()- last_punch < 290){
		temp := time_ms() - last_punch
		;ToolTip, %temp%
		sleep, %temp%
	}
	sleep, -1
	send {1}
	sleep, -1
	send {k}
	sleep, -1
	send {2}
}

eye(){
	while (time_ms()- last_punch < 290){
		temp := time_ms() - last_punch
		sleep, %temp%
		;ToolTip, %temp%
	}
	sleep, -1
	send {1}
	sleep, -1
	send {l}
	sleep, -1
	send {2}
}