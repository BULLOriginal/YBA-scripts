flag := true
freeze(){
	if (flag = true){
		send, {Lshift}
		MouseClick , right, 920, 0, 1, 0, D
		flag := !flag
		return
	}
	else{
		MouseClick , right, 700, 500, 1, 0, U
		send, {Lshift}
		flag := !flag
		return
	}
}