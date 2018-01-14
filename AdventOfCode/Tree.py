class TreeNode():
	def __init__(self, x, d=2):
		self.l = x[0]
		self.r = x[1]
		self.a = d
		self.children = []
		self.weight   = x[0] + x[1]

	def addChild(self, n):
		self.children.append(n)

	def gfv(self):
		if   self.a == 0:
			return self.r
		elif self.a == 1:
			return self.l
		else:
			raise Error("unexpected val")

	def gwgh(self):
		return self.weight + max([0] + map(lambda x: x.gwgh(), self.children))

	def glen(self):
		return 1 + max([0] + map(lambda x: x.glen(), self.children))
	
	def glnw(self):
		l = max([0] + map(lambda x: x.glen(), self.children))
		return self.weight + max([0] + map(lambda x: x.glnw(), filter(lambda x: x.glen() == l, self.children)))
