import CalcObject.CalcObject;
import CalcObject2.CalcObject2;
import InputType.InputType;
import ResultType.ResultType;

public class MyClient {

	public static void main(String args[])
	{
		System.setProperty("java.security.policy","file:///home/yggdralisk/Documents/RSI/Lab2/cz2/srv.policy");
		double wynik;
		CalcObject zObiekt;
		CalcObject2 zObiekt2;
		ResultType wynik2;
		InputType inObj;
		
		inObj = new InputType();
		inObj.x1 = 2;
		inObj.x2 = 3;
		inObj.operation = "add";
		
		if(args.length == 0)
		{
			System.out.println("You have to enter  RMI object address in the form: //host_address/service_name");
			return;
		}
		
		String adres = args[0];
		String adres1 = args[1];
		
		if(System.getSecurityManager() == null)
			System.setSecurityManager( new SecurityManager());
		
		try {
			zObiekt = (CalcObject) java.rmi.Naming.lookup(adres);	
			zObiekt2 = (CalcObject2) java.rmi.Naming.lookup(adres1);
		}catch (Exception e)
		{
			System.out.println("Nie mozna pobrac referencji do "+ adres);
			e.printStackTrace();
			return;
		}
		System.out.println("Referencja "+ adres +" jest pobrana");
		
		try {
			wynik = zObiekt.calculate(1.1,2.2);
			wynik2= zObiekt2.calculate(inObj);
			
		}catch (Exception e)
		{
			System.out.println("Blad zdalnego wywolania.");
			e.printStackTrace();
			return;
		}
		System.out.println("Wynik = "+wynik);
		System.out.println("WYnik2 = "+wynik2.result);
		return;
		
		
		
	}
}
