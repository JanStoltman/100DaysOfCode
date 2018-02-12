#include "GenericCollection.h"
#include<iostream>
#include<algorithm>
using namespace std;

template <class T>
GenericCollection<T>& GenericCollection<T>::operator+(const GenericCollection<T>& addColl){
		mColl.reserve(addColl.mColl.size());
		mColl.insert(mColl.end(),addColl.mColl.begin(),addColl.mColl.end());
		return *this;
}

template <class T>
void GenericCollection<T>::add(T elem){
		mColl.push_back(elem);
}

template<class T>
void GenericCollection<T>::print(){
		for(int i = 0; i < mColl.size(); i++){
				cout<<mColl.at(i)<<endl;
		}
}

template<class T>
void GenericCollection<T>::sort(){
	std::sort(mColl.begin(),mColl.end());
}
