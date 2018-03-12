from random import randint
import sys


class Creature:
    def __init__(self, matrix=None):
        if matrix is None:
            matrix = []
        self.matrix = matrix
        self.eval = sys.maxsize

    def fill_randomly(self, fabs, locs):
        for loc in locs:
            i = randint(1, len(fabs)) - 1
            self.matrix.append([loc, fabs[i]])
            del fabs[i]

    def mutate(self):
        i = randint(0, len(self.matrix) - 1)
        j = randint(0, len(self.matrix) - 1)

        temp = self.matrix[i][1]
        self.matrix[i][1] = self.matrix[j][1]
        self.matrix[j][1] = temp

    def set_matrix(self, mother_mt, father_mt):
        self.matrix = mother_mt + father_mt
        self.check_fabs()

    def check_fabs(self):
        s = set()
        i = 0
        while i < len(self.matrix):
            if self.matrix[i][1] in s:
                self.matrix[i][1] += 1
                if self.matrix[i][1] == len(self.matrix):
                    self.matrix[i][1] = 0
            else:
                s.add(self.matrix[i][1])
                i += 1

    def check_locs(self):
        pass
