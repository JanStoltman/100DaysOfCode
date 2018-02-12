#include"Tesseract.h"

Tesseract::Tesseract(Punkt _x,Punkt _y, Punkt _z,int _t):Figura(_x,_y,_z){t = _t;}
Tesseract::Tesseract(int xx, int xy, int xz, int yx, int yy, int yz, int zx, int zy, int zz,int _t):Figura(xx,xy,xz,yx,yy,yz,zx,zy,zz) {t = _t;}

int Tesseract::pole(){
		return Prostopadloscian(x,y,z).pole() * 6;
}

int Tesseract::objetosc(){
		return Prostopadloscian(x,y,z).objetosc() * 6;
}
