def readFile():
	f = open("Day5DB","r")
	tarr = []
	for line in f:
		tarr.append(int(line))
	return tarr

def main():
	arr = readFile()
	i = 0
	steps = 0
	while(i >= 0 and i < len(arr)):
		a = arr[i]
		if(a >= 3):
			arr[i] -= 1
		else:
			arr[i] += 1
		i += a	
		steps += 1		
	
	print(steps)
	return steps

if __name__ == "__main__":
	main()
