from Lab1.Reader import Reader
from Lab1.Creature import Creature
from Lab1.Algorithm import Algorithm

files = {4: 'had4', 5: 'had5', 6: 'had6', 12: 'had12', 14: 'had14', 16: 'had16', 18: 'had18', 20: 'had20'}


def generate_population(pop_size, file_size):
    population = []
    for i in range(0, pop_size):
        c = Creature()
        c.fill_randomly([i for i in range(0, file_size)], [i for i in range(0, file_size)])
        population.append(c)
    return population


def main():
    file_size = 20
    r = Reader(files[file_size])
    r.print()

    pop_size = 50
    generations = 200
    pm = 0.7
    px = 0.01
    tour = 10

    init_pop = generate_population(pop_size, file_size)
    a = Algorithm(r.flow, r.dist, pop_size, init_pop, generations, pm, px, tour, 't', int(pop_size / 3))
    a.run()


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
