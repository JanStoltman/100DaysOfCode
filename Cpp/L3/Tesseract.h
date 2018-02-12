#ifndef TESSERACT
#define TESSERACT
#include "Prostopadloscian.h"

class Tesseract:public Figura {
private:
    int t;
public:
	Tesseract(Punkt _x, Punkt _y, Punkt _z,int _t);
	Tesseract(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz,int _t);

	int pole();
	int objetosc();
};
#endif
