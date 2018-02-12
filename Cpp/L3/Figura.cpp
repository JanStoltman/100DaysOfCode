#include "Figura.h"
#include "Punkt.h"
#include <iostream>

Figura::Figura(Punkt _x,Punkt _y) {
    x = _x;
    y = _y;
}

Figura::Figura(Punkt _x,Punkt _y,Punkt _z) {
    x = _x;
    y = _y;
    z = _z;
}

Figura::Figura(int xx, int xy, int yx, int yy) {
    x.setX(xx);
    x.setY(xy);
    y.setX(yx);
    y.setY(yy);
}

Figura::Figura(int xx, int xy,int xz, int yx, int yy,int yz, int zx, int zy, int zz) {
    x.setX(xx);
    x.setY(xy);
    x.setZ(xz);
    y.setX(yx);
    y.setY(yy);
    y.setZ(yz);
    z.setX(zx);
    z.setY(zy);
    z.setZ(zz);
}

int Figura::pole(){
	return -9000;
}

int Figura::objetosc(){
	return -9000;
}
