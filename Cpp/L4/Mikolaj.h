#ifndef MIKOLAJ
#define MIKOLAJ 
#include "Czlowiek.h"

using namespace std;
class Mikolaj:public Czlowiek{
	public:
	Mikolaj(vector<Cukierek> _cukierki):Czlowiek(_cukierki){};
	friend ostream& operator<<(ostream& out, const Mikolaj& mk);
	void operator -(Cukierek cukierek);

};

#endif
