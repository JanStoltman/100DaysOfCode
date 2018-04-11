class Node:
    def __init__(self,possibilities=None):
        self.color = -1
        self.possibilities = possibilities
        self.disallowed = []

    def __str__(self, *args, **kwargs):
        return str(self.color)

