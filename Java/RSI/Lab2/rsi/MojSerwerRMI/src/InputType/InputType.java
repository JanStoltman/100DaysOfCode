package InputType;

import java.io.Serializable;

public class InputType implements Serializable{

	private static final long serialVerisonUID = 101L;
	public String operation;
	public double x1;
	public double x2;
	
	public double getx1()
	{
		return x1;
	}
	public double getx2()
	{
		return x2;
	}
}
