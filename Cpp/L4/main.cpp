#include "Cukierek.h"
#include "Czlowiek.h"
#include "Dziecko.h"
#include<iostream> 
using namespace std;

int main(){
	vector<Cukierek> cuk;
	cuk.push_back(Cukierek("Mich"));
	cuk.push_back(Cukierek("Michaa"));
	Czlowiek cl(cuk);
	cout<<cl<<endl;
	cout<<cl.dajCukierki()<<endl;

	return 0;
}

	
