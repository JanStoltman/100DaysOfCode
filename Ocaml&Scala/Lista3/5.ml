 let insertionSort f x = 
	let rec insert ls e =
	match ls with
		[] -> [e]
	|	h::t => if(f(h,e)) then e::h::t else h::insert(t,e)
	
	in fold_left insert(Nil,Nil)
