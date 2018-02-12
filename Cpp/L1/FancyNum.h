#ifndef FANCY
#define FANCY
#include <string>
#include <vector>
#include <iostream>


using namespace std;

class FancyNum {
private:
    vector<int> head, tail;
    bool sign; //false for < 0
    static const int NUM_BASE = 10;
	static const bool DB = false;

public:
    FancyNum(string value);
	FancyNum(vector<int>& _head, vector<int>& _tail);
    ~FancyNum();

    string add(FancyNum numToAdd);
	string multiply(FancyNum numToAdd);

    //Setters & Getters
    vector<int> getHead();
    void setHead(vector<int> _head);
    vector<int> getTail();
    void setTail(vector<int> _tail);
    bool getSign();
    void setSign(bool sign);
    string getString();
private:
    void parseString(string s);
    void addHead(vector<int> _head);
    void addTail(vector<int> _tail);
    void assertHead(vector<int>& _head);
    void assertTail(vector<int>& _tail);
    void reduceHead();
	void reduceTail();
};

#endif

