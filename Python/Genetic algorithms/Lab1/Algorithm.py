import random
import copy

from Lab1.Creature import Creature


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
        self.best = Creature()

    def run(self):
        for generation in range(0, self.generations):
            for creature in self.population:
                self.assess_fitness(creature)
                if creature.eval < self.best.eval:
                    self.best = copy.deepcopy(creature)
            # self.print_fittest()
            self.selection()
            self.crossover()
            self.mutation()

        print("Best " + str(self.best.eval) + " " + str(self.best.matrix))

    def print_fittest(self):
        c = min(self.population, key=lambda x: x.eval)
        print(c.eval)
        print(c.matrix)

    def selection(self):
        if self.selection_type == 'r':
            self.roulette()
        elif self.selection_type == 't':
            self.tournament()
        else:
            raise ValueError("Selection type not supported: " + self.selection_type)

    def roulette(self):
        tmp_pop = []
        s = sum(map(lambda x: x.eval, self.population))
        mi = min(self.population, key=lambda x: x.eval).eval
        mx = max(self.population, key=lambda x: x.eval).eval + mi
        for _ in range(0, self.crossover_size):
            r = random.randint(0, s)
            i = random.randint(0, len(self.population))
            while r < s:
                r += (mx - self.population[i].eval)
                i += 1
                if i >= len(self.population): i = 0

            tmp_pop.append(self.population[i])
        self.population = tmp_pop

    def tournament(self):
        tmp_pop = []
        for _ in range(0, self.crossover_size):
            random.shuffle(self.population)
            tmp = self.population[0:self.tour]
            tmp_pop.append(min(tmp, key=lambda x: x.eval))
        self.population.clear()
        self.population.extend(tmp_pop)

    def crossover(self):
        tmp_pop = []
        while len(self.population) + len(tmp_pop) < self.pop_size:
            random.shuffle(self.population)
            tmp_pop.append(self.breed(self.population[0], self.population[1]))

        self.population.extend(tmp_pop)

    def breed(self, mother, father):
        c1, c2 = self.pmx(mother, father)
        return c1

    def simple(self,mother, father):
        c = Creature()
        l = len(mother.matrix)
        hl = int(l / 2)
        c.set_matrix(mother.matrix[0:hl], father.matrix[hl:l])
        return c

    def pmx(self, mother, father):
        c1 = copy.deepcopy(mother)
        c2 = copy.deepcopy(father)
        size = len(c1.matrix)
        p1, p2 = [0] * size, [0] * size

        for i in range(0, size):
            p1[c1.matrix[i][1]] = i
            p2[c2.matrix[i][1]] = i

        cxpoint1 = random.randint(0, size)
        cxpoint2 = random.randint(0, size - 1)
        if cxpoint2 >= cxpoint1:
            cxpoint2 += 1
        else:
            cxpoint1, cxpoint2 = cxpoint2, cxpoint1

        for i in range(cxpoint1, cxpoint2):
            temp1 = c1.matrix[i][1]
            temp2 = c2.matrix[i][1]

            c1.matrix[i][1], c1.matrix[p1[temp2]][1] = temp2, temp1
            c2.matrix[i][1], c2.matrix[p1[temp2]][1] = temp1, temp2

            p1[temp1], p1[temp2] = p1[temp2], p1[temp1]
            p2[temp1], p2[temp2] = p2[temp2], p2[temp1]

        return c1, c2

    def assess_fitness(self, creature):
        creature.check_fabs()
        result = 0
        for i in range(0, len(creature.matrix)):
            for j in range(i, len(creature.matrix)):
                val = creature.matrix[i]
                val2 = creature.matrix[j]
                d = self.dist[val[0]][val2[0]]
                f = self.flow[val[1]][val2[1]]
                ds = self.dist[val2[0]][val[0]]
                fs = self.flow[val2[1]][val[1]]
                result += f * d + fs * ds
        creature.eval = result

    def mutation(self):
        for c in self.population:
            i = random.uniform(0, 1)
            if i < self.pm:
                c.mutate()
