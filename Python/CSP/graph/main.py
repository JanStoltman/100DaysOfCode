import time

N = 5
graph = [[-1 for _ in range(0,N)] for _ in range(0,N)]

def print_graph():
    for i in range(0, len(graph)):
        print(str(graph[i]) + '\n')


def ch_l(r, c, val):
    return c == 0 or abs(graph[r][c - 1] - val) >= 2


def ch_u(r, c, val):
    return r == 0 or abs(graph[r - 1][c] - val) >= 2

def ch_cu(r, c, val):
    return c == 0 or r == 0 or abs(graph[r - 1][c - 1] - val) >= 1

def ch_cd(r, c, val):
    return r == 0 or r == N - 1 or abs(graph[r + 1][c - 1] - val) >= 1


def check_cond(r, c):
    """
    :param r: Row index
    :param c: Column index
    :return: True if color meets all constraints
    """
    if graph[r][c] == -1:
        return False

    val = graph[r][c]
    return ch_l(r,c,val) and ch_u(r,c,val) and ch_cd(r,c,val) and  ch_cu(r,c,val)


def backtracking():
    for c in range(0,N):
        for r in range(0,N):
            col = 0
            while not check_cond(r,c):
                graph[r][c] = col
                col += 1

    print_graph()

def fowardchecking():
    pass

def main():
    print_graph()
    st = time.time()
    backtracking()
    en = time.time()
    print(str(en-st))

if __name__ == '__main__':
    main()