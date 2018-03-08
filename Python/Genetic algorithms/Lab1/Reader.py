class Reader:
    def __init__(self, file_name):
        self.num = 0
        self.flow = []
        self.dist = []
        self.solution = 0

        with open(file_name) as file:
            self.lines = [line.split() for line in file]

        self.extract()

    def extract(self):
        self.num = int(self.lines[0][0])
        self.flow = [list(map(int, x)) for x in self.lines[2:self.num + 2]]
        self.dist = [list(map(int, x)) for x in self.lines[self.num + 3: self.num*2 + 3]]
        self.solution = int(self.lines[-1][1])

    def print(self):
        print(self.num)
        print("Flow " + str(self.flow))
        print("Distance " + str(self.dist))
        print(self.solution)
