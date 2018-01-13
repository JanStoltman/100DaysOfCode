
class TreeNode():
	def __init__(self, x, d=0):
		self.l = x[0]
		self.r = x[1]
		self.a = d
		self.children = []
		self.weight   = x[0] + x[1]

	def addChild(self, x):
		self.children.append(TreeNode(x))

	def gfv(self):
		if   self.a == 0:
			return self.l
		elif self.a == 1:
			return self.l
		else:
			raise Error("unexpected val")
