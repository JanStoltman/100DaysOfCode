#include "FancyNum.h"
#include "RomeNum.h"
#include <iostream>

using namespace std;

bool checkNum(string tNum);
string getNum();
int getCommand(FancyNum fNum);

int main(int argc, char *argv[]) {
    string num;
    cout<<"Podaj liczbe:"<<endl;
    cin>>num;
    cin.ignore();
    RomeNum fNum(num);

    cout<<endl;
    char comm;
    while(comm !='q') {
        cout<<"Podaj komende:"<<endl;
        comm = cin.get();
        cin.ignore();
        if(comm!='\n') {
            switch(comm) {
            case '_':
                cout<<fNum.getString()<<endl;
				break;
            case '+':
                cout<<"Podaj liczbe do dodania:"<<endl;
                cin>>num;
                cin.ignore();
                cout<<"Wynik dodawania: " << fNum.add(FancyNum(num))<<endl;
                break;
            case '*':
                cout<<"Podaj liczbe do pomnozenia:"<<endl;
                cin>>num;
                cin.ignore();
                cout<<"Wynik mnożenia: "<<fNum.multiply(FancyNum(num))<<endl;
				break;
			case 'R':
				cout<<"Rome: ";
				cout<<fNum.getString()<<endl;
				break;
            default:
                cout<<"Bledna komenda!"<<endl;
                break;
            }
        }
    }

    return 0;
}
