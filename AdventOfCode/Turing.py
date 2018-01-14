class Machine():
	def __init__(self):
		self.tape = [0]
		self.i    = 0
		self.st   = 'A'

	def move(self, inc):
		if   inc + self.i >= len(self.tape):
			self.tape += [0] * abs(inc + self.i - (len(self.tape) - 1))	
			self.i    += inc

		elif inc + self.i < 0:
			self.tape = [0] * abs(inc + self.i) + self.tape
			self.i    = 0

		else:
			self.i += inc

	def write(self,val):
		self.tape[self.i] = val

	def swap(self,s):
		self.st = s

	def cval(self):
		return self.tape[self.i]

	def show(self):
		print self.tape

	def checksum(self):
		print "Checksum: {0}".format(sum(self.tape))
