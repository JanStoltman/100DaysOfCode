class Chromosome:
    def __init__(self, genes_num):
        self.chrs = [0] * genes_num

    def get_predict(self):
        print([0]*4)
        pred = 0
        for n, i in enumerate(self.chrs):
            pred += n * (2 ^ i)

        return pred
