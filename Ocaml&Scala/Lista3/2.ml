let sumProd l = 
 	List.fold_left (fun a x -> (fst a + x, snd a * x)) (0,1) l
