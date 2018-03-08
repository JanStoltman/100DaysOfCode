from Lab1.Reader import Reader
from Lab1.Creature import Creature
from Lab1.Algorithm import Algorithm

files = ['had12', 'had14', 'had16', 'had18', 'had20']


def main():
    r = Reader("had4")
    r.print()

    c = Creature()
    c.fill_randomly([0, 1, 2, 3], [0, 1, 2, 3])  # First value is zero
    c.mutate()

    Algorithm(r.flow, r.dist).get_fitness(c)


if __name__ == "__main__":
    main()

"""
X0. Wczytywanie
    1.Upewnić się co do kolejności macierzy
X1. Osobnik
    1. Generowanie dnaych do fill_randomly
2. Ocena
    1. Per osobnik
3. Krzyżowanie
4. Mutacja
5. Wykresy
6. Profiler
"""
