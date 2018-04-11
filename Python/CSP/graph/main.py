import time
from graph.node import Node

N = 5
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


def check_cond(r, c):
    """
    :param r: Row index
    :param c: Column index
    :return: True if color meets all constraints
    """
    if graph[r][c].color == -1:
        return False

    val = graph[r][c].color
    return ch_l(r, c, val) and ch_u(r, c, val) and ch_cd(r, c, val) and ch_cu(r, c, val)


def backtracking():
    for c in range(0, N):
        for r in range(0, N):
            col = 0
            while not check_cond(r, c):
                graph[r][c].color = col
                col += 1

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


def fowardchecking():
    for c in range(0, N):
        for r in range(0, N):
            col = 0
            while col in graph[r][c].disallowed:
                col += 1

            graph[r][c].color = col
            drop_col(r, c, col)

    print_graph()


def fill_graph():
    graph = [[-1 for _ in range(0, N)] for _ in range(0, N)]


def main():
    fill_graph()
    st = time.time()
    fowardchecking()
    en = time.time()
    print(str(en - st))


if __name__ == '__main__':
    main()
