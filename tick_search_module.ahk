~m::
;ToolTip, 123
while(1<2){
	if (Errorlevel or timeout()){
		;ToolTip, ERR
		reset()
	}
	PixelSearch, Px, Py, 615 ,103, 126, 87, 0x61a21f, 5, Fast
	
	if (Px1 == -1){ ;first encounter / if health is down
		Px1 := Px
		timer := time_ms()
		sleep, 50
	}
	
	if (Px > Px1){  
		health_timing := time_ms() - timer
		last_regen_tick := time_ms()
		;tooltip, %last_regen_tick%
		if (health_timing > 700 and health_timing < 1300){
			summ += health_timing
			avg := summ//counter_func()
		}
		;ToolTip, %health_timing% %Px1% %Px% %avg%
		reset()
	}
}