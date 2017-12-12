def extract_data(line):
	data = line.split("->")
	main = data[0].split(' ')[0]
	weight = int(data[0].split(' ')[1].replace(')','').replace('(',''))
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
	for node in nodes:
		connections[node] = main
#--------First part---------------------------
#search_node, _,_ = extract_data("rmhcw (26)")
#while connections.get(search_node,'--') != '--':
#	search_node = connections.get(search_node,'--')

def get_sub_weights(node, connections, weights):
	sub_nodes = []
	for k,v in connections.items():
		if v == node:
			sub_nodes.append(k)
	

	sub_weights = [get_sub_weights(n,connections,weights) for n in sub_nodes]
	if not(sub_weights[1:] == sub_weights[:-1]):
		print sub_nodes
		print sub_weights

	return sum(sub_weights) + weights[node]

basis = "ykpsek" #First part answer 
get_sub_weights(basis,connections, weights)

			
