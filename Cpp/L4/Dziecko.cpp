#include "Dziecko.h"
#include "Cukierek.h"
#include <string> 

using namespace std;

ostream& operator <<(ostream& out, const Dziecko& dz){
	string temp = "";
	for(int i = 0; i < dz.cukierki.size(); i++){
		temp += "Ha ";
	}

	out<<temp;
	return out;
}

void Dziecko::operator+(Cukierek cukierek){
	cukierki.push_back(cukierek);
}
