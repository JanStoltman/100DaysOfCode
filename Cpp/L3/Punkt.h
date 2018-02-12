#ifndef PUNKT 
#define PUNKT 

class Punkt{
private:
	int x,y,z;

public:
	Punkt(int _x,int _y,int _z);
	Punkt(int _x,int _y);
	Punkt();

	//getters
	int getX();
	int getY();
	int getZ();
	//setters
	void setX(int _x);
	void setY(int _y);
	void setZ(int _z);


};

#endif
