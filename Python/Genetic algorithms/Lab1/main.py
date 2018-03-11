from Lab1.Reader import Reader
from Lab1.Creature import Creature
from Lab1.Algorithm import Algorithm

files = {4: 'had4', 12: 'had12', 14: 'had14', 16: 'had16', 18: 'had18', 20: 'had20'}


def generate_population(pop_size, file_size):
    population = []
    for i in range(0,pop_size):
        c = Creature()
        c.fill_randomly([i for i in range(0, file_size)], [i for i in range(0, file_size)])
        population.append(c)
    return population


def main():
    file_size = 4
    r = Reader(files[file_size])

    pop_size = 10
    generations = 1
    pm = 0.7
    px = 0.01
    tour = 2

    init_pop = generate_population(pop_size, file_size)
    a = Algorithm(r.flow, r.dist, pop_size, init_pop, generations, pm, px, tour, 't', int(pop_size/2))
    a.run()


if __name__ == "__main__":
    main()

"""
x0. Wczytywanie
    1.Upewnić się co do kolejności macierzy
x1. Osobnik
    x1. Generowanie dnaych do fill_randomly
2. Ocena
    1. Per osobnik
3. Krzyżowanie
4. Mutacja
5. Wykresy
6. Profiler
"""
