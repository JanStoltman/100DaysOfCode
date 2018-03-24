import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

public class WorkerImpl extends UnicastRemoteObject implements Worker {

    protected WorkerImpl() throws RemoteException {
        super();
    }

    @Override
    public ResultType compute(InputType inputType) {
        Integer upperBound = inputType.getUpperBound();
        Integer lowerBound = inputType.getLowerBound();

        List<Integer> result = new ArrayList<>();
        int qtyOfDivisors = 0;

        for (int i = lowerBound; i <= upperBound; i++) {
            for (int j = 2; j * j < i; j++) {
                if (i % j == 0) {
                    qtyOfDivisors = 0;
                    break;
                } else {
                    qtyOfDivisors = 1;
                }
            }

            if (qtyOfDivisors == 1) {
                result.add(i);
            }
        }


        ResultType resultType = new ResultType();
        resultType.result = result;

        System.out.println(resultType.result);
        return resultType;
    }

    @Override
    public ResultType mergeResults(ResultTypes input) throws RemoteException {
        List<Integer> finalResult = new ArrayList<>();
        finalResult.add(2);

        for (int i = 0; i < input.resultsTypes.size(); i++) {
            finalResult.addAll(input.resultsTypes.get(i).result);
        }

        ResultType resultType = new ResultType();
        resultType.result = finalResult;
        return resultType;
    }
}
