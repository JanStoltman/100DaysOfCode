package CalcObject2;

import java.rmi.Remote;
import java.rmi.RemoteException;


import InputType.InputType;
import ResultType.ResultType;

public interface CalcObject2 extends Remote{
	public ResultType calculate(InputType inputParam) throws RemoteException;
}
