import time

N = 5
graph = [[-1]*N]*N

def print_graph():
    for i in range(0, len(graph)):
        print(str(graph[i]) + '\n')

def backtracking():
    pass

def fowardchecking():
    pass

def main():
    print_graph()

    st = time.time()
    en = time.time()
    print(str(en-st))

if __name__ == '__main__':
    main()