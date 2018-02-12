#ifndef PROSTOKAT 
#define PROSTOKAT
#include "Figura.h"

class Prostokat:public Figura{
public:
	Prostokat(Punkt _x, Punkt _y, Punkt _z);
	Prostokat(Punkt _x, Punkt _y);
	Prostokat(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz);
    Prostokat(int xx, int xy, int yx, int yy);

	int pole();
	int objetosc();
};

#endif
