def insertionSort[A](f:(A, A) => Boolean, la: List[A]): List[A] = {
	def insert(ls:List[A], e:A):List[A] = ls match{
		case Nil => List(e)
		case h::t => if(f(h,e)) e::h::t else h::insert(t,e)
	}
	
	la.foldLeft(List[A]())((a,b) => insert(a,b))
}
