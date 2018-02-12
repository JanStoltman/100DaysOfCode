#ifndef ANIMAL 
#define ANIMAL
# include <iostream>
# include <string>

using namespace std;

class Animal {
protected:
    static const  bool DB = false;
public:
	   Animal() {
        if(DB) cout<<"Animal created!"<<endl;
    }
  	  ~Animal() {
        if(DB) cout<<"Animal destroyed!"<<endl;
    }
    virtual void dajGlos(){
	cout<<"Animal voice"<<endl;	
	}
};
#endif
