#include <iostream>
#include <math.h>
#include "fancyNum.h"
using namespace std;

FancyNum:: FancyNum(bool isPositive,double mantissa, int base, int exponent) {
    setIsPositive(isPositive);
    setBase(base);
    setMantissa(mantissa);
    setExponent(exponent);
}

FancyNum::FancyNum(double mantissa, int exponent) {
    setIsPositive(true);
    setBase(10);
    setMantissa(mantissa);
    setExponent(exponent);
}

void FancyNum::setMantissa(double _mantissa) {
    if(_mantissa < 1 || _mantissa >=  base) {
        cout << "Bledna mantysa!"<<endl;  //Sprawdzić co z nullem
    } else {
        mantissa = _mantissa;
    }
}

void FancyNum::setBase(int _base) {
    if(_base <= 0) {
        cout<<"Bledna baza!" <<endl;
    } else {
        base = _base;
    }
}

void FancyNum::setIsPositive(bool _isPositive) {
    isPositive = _isPositive;
}

void FancyNum::setExponent(int _exponent) {
    if(_exponent <= 0) {
        cout<<"Bledny exponent!"<<endl;
    } else {
        exponent = _exponent;
    }
}

double FancyNum::evaluate() {
    return (isPositive?1:-1) * mantissa * pow(base,exponent);
}


