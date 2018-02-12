#include"Czlowiek.h"

Czlowiek::Czlowiek(vector<Cukierek> _cukierki){
	cukierki = _cukierki;
}


string Czlowiek::przedstawSie(){
	return "Jestem czlowiekiem";
}

string Czlowiek::dajCukierki(){
	string temp = "";

	for(int i = 0; i < cukierki.size(); i++){
		temp += cukierki.at(i).getTyp() + " ";
	}

	return temp;
}



