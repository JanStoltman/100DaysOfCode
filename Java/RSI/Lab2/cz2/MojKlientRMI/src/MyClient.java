import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Scanner;

public class MyClient {

    public static void main(String[] args) {
        System.setProperty("java.security.policy","file:///home/yggdralisk/Documents/RSI/Lab2/cz2/srv.policy");
        System.out.println("Start");
        ResultType resultType;
        Worker[] workers = new Worker[5];
        ResultTypes res = new ResultTypes();
        Scanner sc = new Scanner(System.in);

        Integer totalRange = sc.nextInt();

//        if(args.length == 0) {
//            System.out.println("You have to enter RMI object address in the form: //host_address/service_name");
//            return;
//        }

        int range = totalRange / 4;

        String worker1Address = "/rmi/127.0.0.1:5000/worker1";
        String worker2Address = "/rmi/127.0.0.1:5000/worker2";
        String worker3Address = "/rmi/127.0.0.1:5000/worker3";
        String worker4Address = "/rmi/127.0.0.1:5000/worker4";
        String worker5Address = "/rmi/127.0.0.1:5000/worker5";

        try {
            System.out.println("Lookup workers bfr");
            workers[0] = (Worker) java.rmi.Naming.lookup(worker1Address);
            workers[1] = (Worker) java.rmi.Naming.lookup(worker2Address);
            workers[2] = (Worker) java.rmi.Naming.lookup(worker3Address);
            workers[3] = (Worker) java.rmi.Naming.lookup(worker4Address);
            workers[4] = (Worker) java.rmi.Naming.lookup(worker5Address);
            System.out.println("Lookup workers aft");
        } catch (Exception e) {
            System.out.println("Nie mozna pobrac referencji do " + worker1Address);
            e.printStackTrace();
            return;
        }

        try {
            res.resultsTypes = new ArrayList<>();

            for (int i = 0; i < 4; i++) {
                InputType in = new InputType();
                in.lowerBound = range * i;
                in.upperBound = in.lowerBound + range;

                resultType = workers[i].compute(in);
                res.resultsTypes.add(resultType);
                System.out.println(resultType.result.toString());
            }

            resultType = workers[4].mergeResults(res);
        } catch (RemoteException e) {
            System.out.println("Blad zdalnego wywolania.");
            e.printStackTrace();
            return;
        }

        System.out.println("Wynik: " + resultType.result.toString());
    }
}
