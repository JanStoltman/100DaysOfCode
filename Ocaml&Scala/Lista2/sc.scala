def fibbA(n:Int):Long = {
	if(n <= 0) 0
	else if(n == 1) 1
	else fibbA(n-2) + fibbA(n-1)
} 

def fibbB(n:Int):Long ={
	def fibbB_tail(n:Int,x:Int,y:Int):Int = {
		if(n <= 0) x
		else if(n==1) y
		else fibbB_tail(n-1,y,y+x)
	}
	fibbB_tail(n,0,1)
}

def root3 (a:Int) = {
	def root3_tail(e:Double,a:Double,x:Double):Double = {
		if(e*abs(a) >= abs(x*x*x - a)){
			x
		}else{
			root3_tail(e,a,x + (a/(x*x) - x)/3)
		}
	}

	def abs(x:Double):Double = 
		if(x<0) -x else x

	if(a > 1)
		root3_tail(0.00000000000001,a,a/3)
	else 
		root3_tail(0.00000000000001,a,a)
}

def initSegment [T](X:(List[T],List[T])):Boolean ={
	if(X._1 == Nil || X._1 == X._2){ 
		true
	}else if(X._2 == Nil){
		false
	}else{
	initSegment((X._1.tail,X._2.tail))	
	}
}

def replaceNth[T](X:(List[T],Int,T)):List[T] = {
	X match{
		case(Nil,_,_) => Nil
		case(h::tl,0,z) => z::tl
		case(h::tl,_,_) =>  h::replaceNth((tl,X._2-1,X._3))
	}  
}

