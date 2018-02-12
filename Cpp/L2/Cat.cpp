#include "Animal.cpp"

class Cat:public Animal {
public:
    Cat() {
        if(DB) cout<<"Cat created!"<<endl;
    }

    ~Cat() {
        if(DB) cout<<"Cat destroyed!"<<endl;
    }

    void dajGlos() {
        cout<<"Miau Miau"<<endl;
    }
};
