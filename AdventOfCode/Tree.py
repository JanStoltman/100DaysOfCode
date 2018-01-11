class TreeNode():
     def __init__(self,initWeight=0):
        self.children = List()
        self.weight = initWeight

	def addChild(self, weight):
		self.children.append(TreeNode(weight))
