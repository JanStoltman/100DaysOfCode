import random


class Algorithm:
    def __init__(self, flow, dist, pop_size, init_pop, generations, pm, px, tour, selection_type, crossover_size):
        self.population = init_pop
        self.flow = flow
        self.dist = dist
        self.pop_size = pop_size
        self.generations = generations
        self.pm = pm
        self.px = px
        self.tour = tour
        self.selection_type = selection_type
        self.crossover_size = crossover_size

    def run(self):
        for generation in range(0, self.generations):
            for creature in self.population:
                self.assess_fitness(creature)
            self.selection()
            self.crossover()
            self.mutation()

    def selection(self):
        if self.selection_type == 'r':
            self.roulette()
        elif self.selection_type == 't':
            self.tournament()
        else:
            raise ValueError("Selection type not supported: " + self.selection_type)

    def roulette(self):
        sum_eval = sum(map(lambda x: x.eval, self.population))


    def tournament(self):
        tmp_pop = []
        for i in range(0, self.crossover_size):
            random.shuffle(self.population)
            tmp = self.population[0:self.tour]
            tmp_pop.append(min(tmp, key=lambda x: x.eval))

        print(tmp_pop)
        self.population = tmp_pop

    def crossover(self):
        pass

    def assess_fitness(self, creature):
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

    def mutation(self):
        pass
