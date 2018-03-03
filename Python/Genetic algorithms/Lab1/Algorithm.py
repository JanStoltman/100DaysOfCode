class Algorithm:
    def __init__(self, flow, dist):
        self.flow = flow
        self.dist = dist

    def run(self):
        pass

    def get_fitness(self, creature):
        sum = 0
        for val in creature.matrix:
            sum += self.flow[val[0]][val[1]] * self.flow[val[0]][val[1]]

        print(sum)