class Algorithm:
    def __init__(self, flow, dist, pop_size, init_pop, generations, pm, px, tour):
        self.population = init_pop
        self.flow = flow
        self.dist = dist
        self.pop_size = pop_size
        self.generations = generations
        self.pm = pm
        self.px = px
        self.tour = tour

    def run(self):
        for i in range(0, self.pop_size):
            pass

    def selection(self):
        pass

    def crossover(self):
        pass

    def tournament(self):
        pass

    def roulette(self):
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
        creature.eval = result
