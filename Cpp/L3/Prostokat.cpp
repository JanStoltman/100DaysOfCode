#include "Prostokat.h"

int Prostokat::pole() {
    return std::abs(x.getX() - y.getX()) * std::abs(y.getY() - x.getY());
}

int Prostokat::objetosc(){
	return 0;
}

Prostokat::Prostokat(Punkt _x, Punkt _y, Punkt _z):Figura(_x,_y,_z) {}
Prostokat::Prostokat(Punkt _x, Punkt _y):Figura(_x,_y) {}
Prostokat::Prostokat(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz):Figura(xx,xy,xz,yx,yy,yz,zx,zy,zz) {}
Prostokat::Prostokat(int xx, int xy, int yx, int yy):Figura(xx,xy,yx,yy) {}
