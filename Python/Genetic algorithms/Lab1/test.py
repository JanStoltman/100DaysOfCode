def check_fabs(matrix):
    print(matrix)
    s = set()
    i = 0
    while i < len(matrix):
        if matrix[i][1] in s:
            matrix[i][1] += 1
            if matrix[i][1] == len(matrix):
                matrix[i][1] = 0
        else:
            s.add(matrix[i][1])
            i += 1
    print(matrix)
    print('\n')


def main():
    check_fabs([[0, 0], [1, 0]])
    check_fabs([[0, 1], [1, 1]])
    check_fabs([[0, 1], [1, 0], [2, 0]])
    check_fabs([[0, 1], [1, 0], [2, 0], [3, 0]])
    check_fabs([[0, 1], [1, 2], [2, 2], [3, 1]])


if __name__ == "__main__":
    main()
