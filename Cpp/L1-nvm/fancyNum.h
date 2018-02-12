#ifndef FANCY_H
#define FANCY_H
class FancyNum {
private:
    bool isPositive;
    int base;
    int  exponent;
    double mantissa;
public:
    FancyNum(bool isPositive, double mantissa, int base, int  exponent);
    FancyNum(double mantissa, int  exponent);
    void setMantissa(double _mantissa);
    void setBase(int _base);
    void setIsPositive(bool _isPositive);
    void setExponent(int _exponent);
	double evaluate();
	FancyNum add(FancyNum mNum);
	FancyNum subtract(FancyNum mNum);
	FancyNum multiply(FancyNum mNum);
	FancyNum divide(FancyNum mNum);
private:
	void normalizeMantissa();
};
#endif
