class Node:
    def __init__(self,possibilities=None):
        self.number = 0
        self.possibilities = set(possibilities)

    def __str__(self, *args, **kwargs):
        return str(self.number)

