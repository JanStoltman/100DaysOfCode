#include "Prostopadloscian.h"
#include "Prostokat.h"

Prostopadloscian::Prostopadloscian(Punkt _x, Punkt _y, Punkt _z):Figura(_x,_y,_z) {}
Prostopadloscian::Prostopadloscian(Punkt _x, Punkt _y):Figura(_x,_y){}
Prostopadloscian::Prostopadloscian(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz):Figura(xx,xy,xz,yx,yy,yz,zx,zy,zz){}
Prostopadloscian::Prostopadloscian(int xx, int xy, int yx, int yy):Figura(xx,xy,yx,yy){}

int Prostopadloscian::pole(){
	return 2*Prostokat(x,y).pole() + std::abs(x.getY() - y.getY()) * std::abs(z.getZ() - x.getZ()) * 2 + std::abs(x.getX() - y.getY()) * std::abs(z.getZ() - x.getZ()) * 2; 
}
int Prostopadloscian::objetosc(){return Prostokat(x,y).pole() * (z.getZ() - x.getX()); }
