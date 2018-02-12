#ifndef GENCOLL 
#define GENCOLL

#include<vector>
using namespace std;

template <class T> class GenericCollection{
		private:
				vector<T> mColl;
		public:
				void add(T elem);
				GenericCollection<T>& operator+(const GenericCollection<T>& addColl);	
				void print();
				void sort();
};
#endif
