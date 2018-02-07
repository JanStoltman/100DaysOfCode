let rec flatten x =
	if x=[] then failwith "pusta lista"
 	else if List.length x = 1 then List.hd x
 	else List.hd x@flatten(List.tl x);;

let rec count x = 
	if List.length(snd x) = 0 then 0
	else if fst x = List.hd(snd x) then 1 
		+ count(fst x,List.tl(snd x))
	else count(fst x,List.tl(snd x));;

let rec replicate x =
	if(snd x < 0) then failwith "Ujemna liczba powtorzen"
	else if(snd x = 0) then []
	else [fst x]@replicate(fst x, snd x - 1);;

let rec sqrtList x =
	if List.length x = 0 then failwith "Podano pusta liste"
	else if List.length x = 1 then [List.hd x * List.hd x]
	else [List.hd x * List.hd x]@sqrtList(List.tl x);;

let rec palindrome x =
	x = List.rev x;;

let rec listLength x = 
	if x = [] then 0
	else 1 + listLength(List.tl x);;
