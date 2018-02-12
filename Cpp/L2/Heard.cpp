#ifndef HERD
#define HERD
#include <iostream>
#include <vector>
#include "Animal.cpp"
#include "Dog.cpp"
#include "Cat.cpp"

using namespace std;

class Herd {
private:
    vector<Animal*> herd;

public:
    Herd() {
        cout<<"Herd created!"<<endl;
        herd.clear();
    }

	vector<Animal*> getHerd(){
		return herd;
	}

	void operator+(Herd nHerd){
		vector<Animal*> tHerd = nHerd.getHerd();
		
		while(tHerd.size() > 0){
			herd.push_back(tHerd.back());
			tHerd.pop_back();
		}	
	}

    void operator+(Animal* anim) {
        //cout<<anim<<endl;
        cout<<"Dodano: ";
        (*anim).dajGlos();
        herd.push_back(anim);

        cout<<endl;
    }

	void operator*(int x){
		vector<Animal*> tempHerd;

		for(int i = 0; i < herd.size(); i++){
			for(int j = 0; j < x; j++){
				tempHerd.push_back(herd.at(i));
			}
		}

		herd = tempHerd;
	}

    void operator-(Animal* anim) {
        for(int i = 0; i < herd.size(); i++) {
            if(herd.at(i) == anim) {
                herd.erase(herd.begin() + i);
                cout<<"Animal erased!"<<endl;
            }
        }
    }

    void dajGlosy() {
        cout<<"Daj glosy:"<<endl;
        for(int i = 0; i < herd.size(); i++) {
            herd.at(i)->dajGlos();
        }

        cout<<endl;
    }


};

#endif
