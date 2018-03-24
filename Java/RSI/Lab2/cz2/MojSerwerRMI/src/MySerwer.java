import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

public class MySerwer {

    public static void main(String[] args) {
        System.setProperty("java.security.policy","file:///home/yggdralisk/Documents/RSI/Lab2/cz2/srv.policy");

//        if(args.length == 0) {
//            System.out.println("You have to enter RMI object address in the form: //host_address/service_name");
//            return;
//        }

        if (System.getSecurityManager() == null) {
            System.setSecurityManager(new SecurityManager());
        }

        try {
            LocateRegistry.createRegistry(1099);
        } catch (RemoteException e) {
            e.printStackTrace();
        }

        try {
            WorkerImpl workerImpl1 = new WorkerImpl();
            WorkerImpl workerImpl2 = new WorkerImpl();
            WorkerImpl workerImpl3 = new WorkerImpl();
            WorkerImpl workerImpl4 = new WorkerImpl();
            WorkerImpl workerImpl5 = new WorkerImpl();

            java.rmi.Naming.rebind("/rmi/127.0.0.1:5000/worker1", workerImpl1);
            java.rmi.Naming.rebind("/rmi/127.0.0.1:5000/worker2", workerImpl2);
            java.rmi.Naming.rebind("/rmi/127.0.0.1:5000/worker3", workerImpl3);
            java.rmi.Naming.rebind("/rmi/127.0.0.1:5000/worker4", workerImpl4);
            java.rmi.Naming.rebind("/rmi/127.0.0.1:5000/worker5", workerImpl5);

            System.out.println("Server is registered");
            System.out.println("Press ctrl + c to stop...");
        } catch (Exception e) {
            System.out.println("SERVER CAN'T BE REGISTERED!");
            e.printStackTrace();
            return;
        }
    }
}
