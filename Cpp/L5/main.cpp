#include<iostream> 
#include"MInt.cpp"
#include"GenericCollection.cpp"
using namespace std;

int main(){
		GenericCollection<char> gen;	
		gen.add('b');
		gen.add('a');
		gen.add('w');
		gen.add('d');
		//gen.print();
		GenericCollection<char> gen2;
		gen2.add('a');
		gen= gen + gen2;
		//gen.print();
		gen.sort();
		gen.print();
		return 0;
}
