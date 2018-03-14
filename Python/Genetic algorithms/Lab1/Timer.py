import time


class Timer:
    def __init__(self):
        self.st = 0
        self.en = 0

    def start(self):
        self.st = time.time()

    def end(self):
        self.en = time.time()

    def __str__(self):
        return str(self.en - self.st)
