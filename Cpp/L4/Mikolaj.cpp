#include "Mikolaj.h"
#include <iostream>

using namespace std;
ostream& operator<<(ostream& out, const Mikolaj& mk){
	string temp = "";
	for(int i = 0; i < mk.cukierki.size(); i++){
		temp += "Ho ";
	}

	out<<temp;
	return out;
}

void Mikolaj::operator-(Cukierek cukierek){
	bool found = false;
	for(int i = 0; i < cukierki.size() && !found; i++){
		if(cukierki.at(i).getTyp() == cukierek.getTyp()){
			cukierki.erase(cukierki.begin() + i);
			found = true;
		}
	}
}
