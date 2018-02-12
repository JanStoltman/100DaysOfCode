#ifndef CZLOWIEK
#define CZLOWIEK

#include<vector>
#include<string>
#include<iostream>
#include"Cukierek.h"

using namespace std;

class Czlowiek {
public:
    vector<Cukierek> cukierki;
    Czlowiek(vector<Cukierek> _cukierki);
    string dajCukierki();
    string przedstawSie();
    friend ostream& operator<<(ostream& out, const Czlowiek& f)
    {
        return out << "Jestem czowiekiem";
    }

};

#endif
