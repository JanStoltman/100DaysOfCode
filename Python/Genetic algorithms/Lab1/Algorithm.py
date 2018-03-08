class Algorithm:
    def __init__(self, flow, dist):
        self.flow = flow
        self.dist = dist

    def run(self):
        pass

    def get_fitness(self, creature):
        print(creature.matrix)
        result = 0
        for i in range(0, len(creature.matrix)):
            for j in range(i, len(creature.matrix)):
                val = creature.matrix[i]
                val2 = creature.matrix[j]
                d = self.dist[val[0]][val2[0]]
                f = self.flow[val[1]][val2[1]]
                result += f * d

        print('Fitness ' + str(result))
