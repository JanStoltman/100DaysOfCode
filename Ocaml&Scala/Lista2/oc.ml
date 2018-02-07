let rec fibbA n = 
	if n<=0 then 0
	else if n = 1 then 1
	else fibbA(n-2) + fibbA(n-1)

let rec fibbB n = 
	let rec fibbB_tail (n,x,y) =(
		if n <= 0 then x
		else if n = 1 then y
		else fibbB_tail(n-1, y, x+y)
		)
	in fibbB_tail(n,0,1)


let rec root3 a =(
	let rec root3_tail(e,a,x) =
	if((e *. abs a ) >= abs(x *. x *. x -. a)) then x
	else
	 root3_tail(e,a,x +. (a /. (x *. x) -. x) /. 3.0)	
	and abs x = 
		if x < 0.0 then -1.0 *. x
		else x

	in 	if a > 1.0 then
		root3_tail(0.00000000000001,a,a /. 3.0)
	else
		 root3_tail(0.00000000000001,a,a)
)

let rec initSegment x = 
	if(fst x = [] || fst x = snd x) then true
	else if(snd x = []) then false 
	else initSegment((List.tl(fst x),List.tl(snd x)))

let rec replaceNth x = 
	match x with
		([],_,_) -> []
		|(h::tl,0,a) -> a::tl
		|(h::tl,a,b) ->  h::replaceNth((tl,a-1,b))
		;;

let wz a = 
	match a with 
	[_;(_,x)] -> x
|	_ -> 1;;
