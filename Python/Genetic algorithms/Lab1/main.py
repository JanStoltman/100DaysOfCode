from Lab1.Reader import Reader
from Lab1.Creature import Creature
from Lab1.Algorithm import Algorithm

files = {4: 'had4', 12: 'had12', 14: 'had14', 16: 'had16', 18: 'had18', 20: 'had20'}


def generate_population(pop_size, fabs, locs):
    population = [Creature()] * pop_size
    for c in population:
        c.fill_randomly(fabs, locs)
    return population


def main():
    size = 4
    r = Reader(files[size])
    c = Creature()
    c.fill_randomly([i for i in range(0, size)], [i for i in range(0, size)])  # First value is zero
    c.mutate()

    pop_size = 10
    generations = 10
    pm = 0.7
    px = 0.01
    tour = 5
    init_pop = generate_population(pop_size, [i for i in range(0, size)], [i for i in range(0, size)])
    a = Algorithm(r.flow, r.dist, pop_size, init_pop, generations, pm, px, tour)
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
