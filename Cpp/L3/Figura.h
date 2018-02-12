#ifndef FIGURA
#define FIGURA
#include"Punkt.h"
#include <cmath>

class Figura {
protected:
    Punkt  x,y,z;

public:
	Figura(Punkt _x, Punkt _y, Punkt _z);
	Figura(Punkt _x, Punkt _y);
	Figura(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz);
    Figura(int xx, int xy, int yx, int yy);	

	virtual int pole();
	virtual int objetosc();

};

#endif
