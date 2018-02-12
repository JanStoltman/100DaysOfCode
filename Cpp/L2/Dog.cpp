#include "Animal.cpp"

class Dog:public Animal {
public:
    Dog() {
        if(DB) cout<<"Dog created!"<<endl;
    }

    ~Dog() {
        if(DB) cout<<"Dog destroyed!"<<endl;
    }

    void dajGlos() {
        cout<<"Hau Hau"<<endl;
    }
};
