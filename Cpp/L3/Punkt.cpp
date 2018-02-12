#include "Punkt.h"

Punkt::Punkt(int _x, int _y, int _z) {
    x = _x;
    y = _y;
    z = _z;
}

Punkt::Punkt(int _x, int _y) {
    x = _x;
    y = _y;
    z = 0;
}

Punkt::Punkt(){
	x = 0;
	y = 0;
	z = 0;
}

int Punkt::getX() {
    return x;
}

int Punkt::getY() {
    return y;
}

int Punkt::getZ() {
    return z;
}

void Punkt::setX(int _x) {
    x = _x;
}

void Punkt::setY(int _y) {
    y = _y;
}

void Punkt::setZ(int _z) {
    z = _z;
}
