import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import CalcObjImpl.CalcObjImpl;
import CalcObjImpl2.CalcObjImpl2;

public class MySerwer {

	public static void main(String args[])
	{
		System.setProperty("java.security.policy","file:///home/yggdralisk/Documents/RSI/Lab2/cz2/srv.policy");
		if(args.length == 0)
		{
			System.out.println("You have to enter  RMI object address in the form: //host_address/service_name");
			return;
		}

		try{
		    Registry reg = LocateRegistry.createRegistry(1099);
        }catch(RemoteException e)
        {
            e.printStackTrace();
        }

		if(System.getSecurityManager() == null)
			System.setSecurityManager( new SecurityManager());

			try {
				CalcObjImpl implObiektu = new CalcObjImpl();
				CalcObjImpl2 implObiektu2 = new CalcObjImpl2();
				
				java.rmi.Naming.rebind(args[0], implObiektu);
				java.rmi.Naming.rebind(args[1], implObiektu2);
				System.out.println("Server is registered now :-)");
				System.out.println("Press Ctrl+C to stop...");
			}catch (Exception e) {
				System.out.println("SERVER CANT BE REGISTERED");
				e.printStackTrace();
				return;
			}
	}
	
	
}
