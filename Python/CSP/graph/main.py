import time
from graph.node import Node
import random

N = 5
rets = 0
used_cols = set([])
graph = [[Node() for _ in range(0, N)] for _ in range(0, N)]


def print_graph():
    for i in range(0, len(graph)):
        print(str(list(map(lambda x: str(x), graph[i]))) + '\n')


def ch_l(r, c, val):
    return c == 0 or abs(graph[r][c - 1].color - val) >= 2


def ch_u(r, c, val):
    return r == 0 or abs(graph[r - 1][c].color - val) >= 2


def ch_cu(r, c, val):
    return c == 0 or r == 0 or abs(graph[r - 1][c - 1].color - val) >= 1


def ch_cd(r, c, val):
    return c == 0 or r == N - 1 or abs(graph[r + 1][c - 1].color - val) >= 1


def ch_du(r, c, val):
    return c == N - 1 or r == 0 or abs(graph[r - 1][c + 1].color - val) >= 1


def ch_dd(r, c, val):
    return c == N - 1 or r == N - 1 or abs(graph[r + 1][c + 1].color - val) >= 1


def check_cond(r, c):
    if graph[r][c].color == -1:
        return False

    val = graph[r][c].color
    return ch_l(r, c, val) and ch_u(r, c, val) and ch_cd(r, c, val) and ch_cu(r, c, val) and ch_dd(r, c, val) and ch_du(
        r, c, val)


def backtracking(heur):
    for c in range(0, N):
        for r in range(0, N):
            col = heur()
            while not check_cond(r, c):
                graph[r][c].color = col
                col = heur(col)
            used_cols.add(col)

    print_graph()


def d_r(r, c, val):
    if not c == N - 1:
        graph[r][c + 1].disallowed.extend([val, val + 1])


def d_d(r, c, val):
    if not r == N - 1:
        graph[r + 1][c].disallowed.extend([val, val + 1])


def d_cu(r, c, val):
    if not (c == N - 1 or r == 0):
        graph[r - 1][c + 1].disallowed.append(val)


def d_cd(r, c, val):
    if not (c == N - 1 or r == N - 1):
        graph[r + 1][c + 1].disallowed.append(val)


def drop_col(r, c, val):
    d_r(r, c, val)
    d_d(r, c, val)
    d_cu(r, c, val)
    d_cd(r, c, val)


def forwardchecking(heur):
    for c in range(0, N):
        for r in range(0, N):
            col = heur()
            while col in graph[r][c].disallowed:
                col = heur(col)
            used_cols.add(col)

            graph[r][c].color = col
            drop_col(r, c, col)

    print_graph()


def fill_graph():
    global graph
    graph = [[-1 for _ in range(0, N)] for _ in range(0, N)]


def next_heur(col=-1):
    return col + 1


def next_two_heur(col=-1):
    return col + 2


def random_heur(col=-1):
    return random.randint(0, N - 1)


def main():
    global rets
    st = time.time()
    print("Back: \n")
    backtracking(next_heur)
    print('Used colors: ' + str(len(used_cols)))
    print('Rets: ' + str(rets))

    used_cols.clear()
    rets = 0

    print("Fow: \n")
    forwardchecking(next_heur)
    print('Used colors: ' + str(len(used_cols)))
    print('Rets: ' + str(rets))
    en = time.time()
    print('Time ' + str(en - st))


if __name__ == '__main__':
    main()
