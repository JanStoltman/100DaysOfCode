from Lab1.Algorithm import Algorithm
from Lab1.Creature import Creature
from Lab1.Reader import Reader
from Lab1.Timer import  Timer
from Lab1.Writer import write
from Lab1.Random import RandomAlg

files = {4: 'had4', 5: 'had5', 6: 'had6', 12: 'had12', 14: 'had14', 16: 'had16', 18: 'had18', 20: 'had20'}


def generate_population(pop_size, file_size):
    population = []
    for i in range(0, pop_size):
        c = Creature()
        c.fill_randomly([i for i in range(0, file_size)], [i for i in range(0, file_size)])
        population.append(c)
    return population


def main():
    file_size = 12
    t = Timer()
    r = Reader(files[file_size])
    r.print()

    t.start()
    rn = RandomAlg()
    rn.search(r.flow, r.dist, [i for i in range(0, file_size)],[i for i in range(0, file_size)], r.solution)
    t.end()
    print("Ranom " + str(t))

    # Algorithm params
    pop_size = 10
    generations = 10
    px = 0.7
    pm = 0.01
    tour = 50

    repeats = 10  # number of repeats for medium
    data = str("roulette")
    best = []
    worst = []

    t.start()
    for i in range(repeats):
        init_pop = generate_population(pop_size, file_size)
        a = Algorithm(r.flow, r.dist, pop_size, init_pop,
                      generations, pm, px, tour, 'r', int(pop_size / 3))
        a.run()
        best.append(a.best.eval)
        worst.append(a.worst)
    t.end()
    print(str(t) + " sek")

    # Write current alg
    write('Pokolenia2', "<{0}, {1}, {2}>\n".format(data,
                                                  str(sum(best) / len(best)),
                                                  str(sum(worst) / len(worst))))


if __name__ == "__main__":
    main()

"""
x0. Wczytywanie
    1.Upewnić się co do kolejności macierzy
x1. Osobnik
    x1. Generowanie dnaych do fill_randomly
x2. Ocena
    1x. Per osobnik
3. Krzyżowanie
x4. Mutacja
5. Wykresy
6. Profiler
"""
