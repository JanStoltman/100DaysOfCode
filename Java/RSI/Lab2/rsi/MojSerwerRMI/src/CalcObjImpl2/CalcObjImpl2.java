package CalcObjImpl2;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import CalcObject2.CalcObject2;
import InputType.InputType;
import ResultType.ResultType;

public class CalcObjImpl2 extends UnicastRemoteObject implements CalcObject2{

	public CalcObjImpl2() throws RemoteException{
		super();
	}
	
	public ResultType calculate(InputType inParam) throws RemoteException
	{
		double zm1, zm2;
		ResultType wynik = new ResultType();
		 
		zm1 = inParam.getx1();
		zm2 = inParam.getx2();
		wynik.result_description = "Operacja " + inParam.operation;
		
		switch(inParam.operation) {
		case "add" :
			wynik.result = zm1 + zm2;
			break;
		case "sub" : 
			wynik.result = zm1-zm2;
			break;
		default: 
			wynik.result = 0;
			wynik.result_description = "Zla operacja";
			return wynik;
		}
		return wynik;
	}
}