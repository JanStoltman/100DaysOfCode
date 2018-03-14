from random import randint
import copy


class RandomAlg():
    def search(self, flow, dist, fabs, locs, exp_res):
        matrix = self.fill_randomly(fabs, locs)
        while self.assess_fitness(flow, dist, matrix) != exp_res:
            matrix = self.fill_randomly(fabs, locs)

    def fill_randomly(self, fabs, locs):
        f = copy.deepcopy(fabs)
        matrix = []
        for loc in locs:
            i = randint(1, len(f)) - 1
            matrix.append([loc, f[i]])
            del f[i]

        return matrix

    def assess_fitness(self, flow, dist, matrix):
        result = 0
        for i in range(0, len(matrix)):
            for j in range(i, len(matrix)):
                val = matrix[i]
                val2 = matrix[j]
                d = dist[val[0]][val2[0]]
                f = flow[val[1]][val2[1]]
                ds = dist[val2[0]][val[0]]
                fs = flow[val2[1]][val[1]]
                result += f * d + fs * ds

        return result
