#include<iostream>
#include "Prostokat.h"
#include "Prostopadloscian.h"
#include "Tesseract.h"
using namespace std;

int main() {
	Punkt x(0,0);
	Punkt y(2,2);
	Punkt z(1,1,3);

	Figura f(x,y);
	cout<<f.pole()<<endl;

	Prostokat p(x,y);
	cout<<p.pole()<<endl;

	Prostopadloscian pr(x,y,z);
	cout<<pr.pole()<<endl;

	Tesseract tr(x,y,z,9);
	cout<<tr.pole()<<endl;
	cout<<tr.objetosc()<<endl;
    return 0;
}
