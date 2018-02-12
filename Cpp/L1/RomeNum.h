#ifndef ROME
#define ROME
#include "FancyNum.h"
#include <map>
using namespace std;

class RomeNum: public FancyNum {
private:
  map<int, string> romeNums ={
        {1000, "M"}, {900, "CM"},
        {500, "D"}, {400, "CD"},
        {100, "C"}, { 90, "XC"},
        { 50, "L"}, { 40, "XL"},
        { 10, "X"}, { 9, "IX"},
        { 5, "V"}, { 4, "IV"},
        { 1, "I"},
        {800, "DCCC"}, {700, "DCC"},
        {600, "DC"}, { 300, "CCC"},
        { 200, "CC"},{80 , "LXXX"},
        {70, "LXX"}, {60, "LX"},
        {30, "XXX"}, {20, "XX"},
        {8, "VIII"}, { 7, "VII"},
        { 6, "VI"}, { 3, "III"},
        { 2, "II"},
      	{ 0, ""}};
public:
	RomeNum(string num);
	string getString(); 
};

#endif
