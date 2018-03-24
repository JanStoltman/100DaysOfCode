import java.rmi.Remote;
import java.util.List;

public interface Worker extends Remote {
    List<Integer> compute(Integer lowerBound, Integer upperBound);
}
