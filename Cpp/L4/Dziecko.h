#ifndef DZIECKO
#define DZIECKO

#include <vector>
#include <iostream>
#include <stdio.h>
#include "Czlowiek.h"
#include "Cukierek.h"

using namespace std;
class Dziecko:public Czlowiek{
	public:
		Dziecko(vector<Cukierek> _cukierki):Czlowiek(_cukierki){};
		friend ostream& operator<<(ostream& out, const Dziecko& dz);
		void operator+(Cukierek cukierek);
};


#endif
