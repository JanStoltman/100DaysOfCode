import time

from square.node import Node

N = 5
solutions = 0
graph = [[Node(range(1, N + 1)) for _ in range(0, N)] for _ in range(0, N)]


def check_column(r, c, num):
    for ri in range(0, N):
        if graph[ri][c].number == num and ri != r: return False

    return True


def check_row(r, c, num):
    for ci in range(0, N):
        if graph[r][ci].number == num and ci != c: return False

    return True


def print_graph():
    for i in range(0, len(graph)):
        print(str(list(map(lambda x: str(x), graph[i]))) + '\n')

def print_n_count_graph():
    print_graph()
    global solutions
    solutions += 1


def check_cond(r, c):
    num = graph[r][c].number
    return check_column(r, c, num) and check_row(r, c, num)


def backtracking(r, c):
    for num in range(1, N + 1):
        graph[r][c].number = num
        if check_cond(r, c):
            if (r == N - 1 and c == N - 1):
                print_n_count_graph()
                print('\n')

            elif (c == N - 1):
                backtracking(r + 1, 0)

            else:
                backtracking(r, c + 1)
        else:
            graph[r][c].number = 0
    graph[r][c].number = 0


def drop_col(r, c, val):
    dexs = []

    for ci in range(0, N):
        if ci != c and val in graph[r][ci].possibilities:
            dexs.append((r,ci))
            graph[r][ci].possibilities.remove(val)
        if len(graph[r][ci].possibilities) == 0: return dexs, False

    return dexs, True


def drop_row(r, c, val):
    dexs = []
    for ri in range(0, N):
        if ri != r and val in graph[ri][c].possibilities:
            dexs.append((ri,c))
            graph[ri][c].possibilities.remove(val)
        if len(graph[ri][c].possibilities) == 0: return dexs, False

    return dexs, True


def drop_val(r, c):
    val = graph[r][c].number
    dexs_row, val_row = drop_row(r, c, val)
    dexs_col, val_col = drop_col(r,c,val)
    return dexs_col + dexs_row, val_col and val_row


def readd_col(r, c, val, dexs):
    for ci in range(0, N):
        if ci != c and (r,ci) in dexs: graph[r][ci].possibilities.add(val)


def readd_row(r, c, val, dexs):
    for ri in range(0, N):
        if ri != r and (ri,c) in dexs: graph[ri][c].possibilities.add(val)


def readd_val(r, c, dexs):
    val = graph[r][c].number
    readd_col(r, c, val, dexs)
    readd_row(r, c, val, dexs)


def fowardchecking(r, c):
    for num in graph[r][c].possibilities.copy():
        graph[r][c].number = num
        dexs, val = drop_val(r,c)
        if val:
            if (r == N - 1 and c == N - 1):
                print_n_count_graph()
                print('\n')

            elif (c == N - 1):
                fowardchecking(r + 1, 0)

            else:
                fowardchecking(r, c + 1)

            readd_val(r, c, dexs)
            graph[r][c].number = 0
        else:
            readd_val(r, c, dexs)
            graph[r][c].number = 0


    graph[r][c].number = 0


def main():
    st = time.time()
    backtracking(0, 0)
    en = time.time()
    print("Time: " + str(en - st))
    print("Solutins found: " + str(solutions))


if __name__ == "__main__":
    main()
