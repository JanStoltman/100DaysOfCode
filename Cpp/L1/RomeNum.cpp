#include "RomeNum.h"
#include <cmath>
using namespace std;

RomeNum::RomeNum(string num):FancyNum(num){}

string RomeNum::getString(){
	string tempRes;
	int x = getHead().size()-1;
	for(int i = 0; i < getHead().size();x--, i++){
		if(x > 0){
		tempRes += romeNums.at(getHead().at(i) * pow(10.0,(double)x));
		} else{
		tempRes += romeNums.at(getHead().at(i));
		}
	}
	
	return tempRes;
}

