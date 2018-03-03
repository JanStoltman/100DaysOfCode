from random import randint


class Creature:
    def __init__(self, matrix=None):
        if matrix is None:
            matrix = []
        self.matrix = matrix

    def fill_randomly(self, fabs, locs):
        for fab in fabs:
            i = randint(1, len(locs)) - 1
            self.matrix.append([fab, locs[i]])
            del locs[i]

    def mutate(self):
        i = randint(0, len(self.matrix) - 1)
        j = randint(0, len(self.matrix) - 1)

        temp = self.matrix[i][1]
        self.matrix[i][1] = self.matrix[j][1]
        self.matrix[j][1] = temp
