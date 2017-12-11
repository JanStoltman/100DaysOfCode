def extract_data(line):
	data = line.split("->")
	main = data[0].split(' ')[0]
	weight = data[0].split(' ')[1].replace(')','').replace('(','')
	if(len(data) > 1):
		nodes = map(lambda s: s.rstrip().strip(), data[1].split(","))
		return main,nodes,weight
	else:
		return main,[],weight


db_file = open("Day7DB","r")
connections = {}
weights = {}

for line in db_file.readlines():
	main, nodes, weight = extract_data(line)
	weights[main] = weight
	print main
	print nodes
	for node in nodes:
		connections[node] = main

basis = "ykpsek" #First part answer 

search_node, _,_ = extract_data("rmhcw (26)")
while connections.get(search_node,'--') != '--':
	search_node = connections.get(search_node,'--')
