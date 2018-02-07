def sumProd(l:List[Int]) = {
	l.foldLeft((0,1))((x,y) => (x._1 + y, x._2 * y))
}
