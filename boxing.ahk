time_ms(){
return (a_hour*3600 + a_min*60 + a_sec)*1000 + a_msec
}






global last_regen_tick := time_ms()

global flag := true


global timer = time_ms() ;Yba_health_parameters
global health_timing ; через сколько мс был предыдущий тик
global Px1 := -1
global avg := 1010 ;среднее значение
global summ := 0 ;сумма всех таймингов хила
global counter := 0
global regen_tick
global heal_retry_time := time_ms()

p UP::heal()

^p::send, {p}
heal_retry_time := time_ms()



#include boxing module.ahk
#include tick_search_module.ahk
#include freeze.ahk

;o::freeze()




since_last_heal(){
	return time_ms() - heal_retry_time
}

counter_func(){
	counter++
	return counter
}

regen_tick(){
	regen_tick := time_ms() - last_regen_tick
	return regen_tick
}



heal(){
test := since_last_heal()
if (since_last_heal() > 2000){
	heal_retry_time := time_ms()
	regen_tick := time_ms() - last_regen_tick
	;toolTip, %regen_tick%	;
	corr := 300
	if (regen_tick < avg - corr){
			toolTip, %temp%
			temp := avg - corr - regen_tick()
			if (temp < 5000){
				toolTip, %temp%
				sleep, %temp%    
			}
		}
	else{
		test123 := avg * 2 - corr - regen_tick
		;toolTip, test123 %test123%
		sleep, %test123%
	}

	send {p down}
	sleep, 10
	send {p up}
	sleep, 500
	send {p down}
	sleep, 10
	send {p up}
	sleep, 10
	send {q down}
	send {q up}
}
}








reset(){
	timer := time_ms()
	Px1 := -1
}

timeout(){
	if time_ms() - timer > 1500
		return true
	else
		return false
}


