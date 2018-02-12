#include "FancyNum.h"

using namespace std;

FancyNum::FancyNum(string s) {
    parseString(s);
    reduceHead();
    reduceTail();
  if(DB)  cout<<"FNum created: "<<getString()<<endl;
}

FancyNum::FancyNum(vector<int>& _head, vector<int>& _tail) {
    	head = _head;
    	tail = _tail;

    if(DB) cout<<"FNum created: "<<getString()<<endl;
}

FancyNum::~FancyNum() {
    if(DB) cout<<"FNum deleted! "<<getString()<<endl;
}

void FancyNum::parseString(string s) {
    int i = 0;

    if(s.length() > 0 && s[0] == '-') {
        setSign(false);
        i++;
    }

    while(s.length() > i && s [i] != ',' && s[i] != '.') {
        head.push_back((int)s[i] - '0');
		if(DB)  cout<<i<<" "<<s[i]<<endl;
        i++;
    }

    i++; //skip . or ,

    while(s.length() > i) { //get tail after .or ,
        tail.push_back((int)s[i] - '0');
        i++;
    }
}

string FancyNum::add(FancyNum numToAdd) {
    addHead(numToAdd.getHead());
    if(DB) cout<<"Head added!"<<endl;
    addTail(numToAdd.getTail());
    if(DB)cout<<"Tail added!"<<endl;
    return getString();
}

string FancyNum::multiply(FancyNum numToAdd) {
    vector<int> tempRes,tempTail;
    FancyNum tempNum("0");
    for(int i = numToAdd.getTail().size()-1; i >=0; i--) {
        tempRes.clear();
        tempTail.clear();
        for(int x = tail.size()-1; x >=0; x--) {
            tempRes.insert(tempRes.begin(),tail.at(x) * numToAdd.getTail().at(i));
        }

        for(int x = head.size()-1; x>=0; x--) {
            tempRes.insert(tempRes.begin(),head.at(x) * numToAdd.getTail().at(i));
        }

        for(int j = 0; j <= (i + tail.size()); j++) {
            if(tempRes.size() == 0) {
                tempRes.push_back(0);
                tempRes.push_back(0);
            }
            tempTail.insert(tempTail.begin(),tempRes.back());
            tempRes.pop_back();
        }
        tempNum.add(FancyNum(tempRes,tempTail));
    }
	
		int i,x;
	for(i = numToAdd.getHead().size() - 1,x = 0; i >= 0; i --, x++){
		int numToMul = numToAdd.getHead().at(i);
		for(int j  = 0; j < numToMul + numToMul * 9 * x  ; j++){
			tempNum.add(FancyNum(head,tail));
		}
	}
	
	head = tempNum.getHead();
	tail = tempNum.getTail();
    return getString();
}

void FancyNum::addHead(vector<int> _head) {
    assertHead(_head);
    if(DB) cout<<"Head asserted!"<<endl;
    for(int i = _head.size()-1; i >= 0; i--) {
        head.at(i) = head.at(i) + _head.at(i);
        if(DB) cout<<_head.at(i)<<" "<<i<<endl;
    }
    reduceHead();
}

void FancyNum::addTail(vector<int> _tail) {
    assertTail(_tail);
    if(DB)cout<<"Tail asserted"<<endl;
    for(int i = 0; i<tail.size(); i++) {
        tail.at(i) = tail.at(i) + _tail.at(i);
        if(DB) cout<<_tail.at(i)<<" "<<i<<endl;
    }
    reduceTail();
}

void FancyNum::assertHead(vector<int>& _head) {
    if(_head.size() > head.size()) {
        if(DB) cout<<"_head size bigger -- assert head"<<endl;
        while(_head.size() > head.size()) {
            head.insert(head.begin(),0);
        }
    } else {
        while(head.size() > _head.size()) {
            _head.insert(_head.begin(),0);
        }
    }
}

void FancyNum::assertTail(vector<int>& _tail) {
    if(_tail.size() > tail.size()) {
        if(DB) cout<<"_tail size bigger -- assert tail"<<endl;
        while(_tail.size() > tail.size()) {
            tail.push_back(0);
        }
    } else {
        while(tail.size() > _tail.size()) {
            _tail.push_back(0);
        }
    }
}

void FancyNum::reduceHead() {
	if(DB) cout<<"reduce head"<<endl;
    bool term = false;
    while(!term) {
        term = true;
        for(int i = head.size() -1 ; i >= 0; i--) {
            if(head.at(i) >= NUM_BASE) {
                term = false;
                if(i == 0) {
                    head.insert(head.begin(),0);
                    i++;
                    head.at(i) = head.at(i) -NUM_BASE;
                    head.at(i-1) ++;
                } else {
                    head.at(i) = head.at(i) - NUM_BASE;
                    head.at(i-1) ++;
                }
            }
        }
    }

    while(head.size() > 1 &&  head.front() == 0)  {
        head.erase(head.begin());
    }
}

void FancyNum::reduceTail() {
    bool term = false;
    while(!term) {
        term = true;
        for(int i = tail.size()-1; i >= 0; i--) {
            if(tail.at(i) >= NUM_BASE) {
                term = false;
                if(DB) cout<<"reduce -- "<<tail.at(i)<<endl;
                if(i ==0) {
                    tail.at(i) = tail.at(i)-NUM_BASE;
                    head.back() ++;
                    reduceHead();
                } else {
                    tail.at(i) = tail.at(i) - NUM_BASE;
                    tail.at(i-1) ++;
                }
            }

        }
    }
    while(tail.size() > 0 && tail.back() == 0)
        tail.pop_back();
}

string FancyNum::getString() {
    string tempS = "";
    if(sign=='-') tempS+=sign;
    for(int i = 0; i < head.size(); i++)
		tempS += (char)(head.at(i) + (int)'0');
	if(head.size() == 0) tempS += '0';
    if(tail.size() > 0)
        tempS +=',';
    for(int i = 0 ; i < tail.size(); i++)
        tempS+=(char)(tail.at(i) + (int)'0');
    return tempS;
}

void FancyNum::setSign(bool _sign) {
    sign = _sign;
}

vector<int> FancyNum::getHead() {
    return head;
}

vector<int> FancyNum::getTail() {
    return tail;
}
