let rec quicksort = function 
	[] -> []
|	[x] -> [x]
|	xs -> let small = List.filter (fun y -> y< List.hd xs) xs
		and large = List.filter(fun y -> y >= List.hd xs) (List.tl xs)
		in quicksort small@[List.hd xs]@quicksort large;; 

let small xs = List.filter (fun y -> y < List.hd xs ) xs
let large xs  = List.filter (fun y -> y >= List.hd xs ) xs


let rec quicksort' = function
	[] -> []
| 	 x::xs -> let small = List.filter (fun y -> y < x ) xs
	and large = List.filter (fun y -> y > x ) xs
	in quicksort' small @ (x :: quicksort' large);;
