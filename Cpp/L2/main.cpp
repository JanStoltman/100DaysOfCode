#include <iostream>
#include "Heard.cpp"

using namespace std;

int main() {
    cout<<"Witaj w zwierzomatorze!"<<endl;
    Herd herd;
	Herd sHerd;
	
	sHerd + new Dog();
    herd + new Dog();
    herd.dajGlosy();

	Cat c;
	herd + &c;
	herd.dajGlosy();

	herd + sHerd;
	herd.dajGlosy();
	
	herd.dajGlosy();
	herd*3;
	herd.dajGlosy();
    return 0;
}
