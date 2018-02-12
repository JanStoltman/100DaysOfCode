#ifndef PROSTOPADLOSCIAN 
#define PROSTOPADLOSCIAN
#include "Figura.h"

class Prostopadloscian:public Figura{
public:
	Prostopadloscian(Punkt _x, Punkt _y, Punkt _z);
	Prostopadloscian(Punkt _x, Punkt _y);
	Prostopadloscian(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz);
    Prostopadloscian(int xx, int xy, int yx, int yy);

	int pole();
	int objetosc();
};

#endif
