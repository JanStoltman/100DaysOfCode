import java.io.Serializable;

public class InputType implements Serializable {
    private static  final long serialVersionUID = 101L;
    public Integer upperBound;
    public Integer lowerBound;

    /**
     *
     * @return upper bound of prime numbers list range (Integer)
     */
    public Integer getUpperBound() {
        return upperBound;
    }

    /**
     *
     * @return lower bound of prime numbers list range (Integer)
     */
    public Integer getLowerBound() {
        return lowerBound;
    }
}
