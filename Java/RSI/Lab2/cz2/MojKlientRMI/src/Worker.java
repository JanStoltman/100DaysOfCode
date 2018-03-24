import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Worker extends Remote {
    /**
     *
     * @param inputType
     * @return computes list of prime numbers based on input range (ResultType)
     * @throws RemoteException
     */
    ResultType compute(InputType inputType) throws RemoteException;

    /**
     *
     * @param input
     * @return merges lists of numbers into one list (ResultType)
     * @throws RemoteException
     */
    ResultType mergeResults(ResultTypes input) throws RemoteException;
}
