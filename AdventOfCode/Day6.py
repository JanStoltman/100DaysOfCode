
def has_duplicates(a):
	return len(a) != len(set(a))

def make_round(a):
	i = a.index(max(a))
	val = a[i]
	a[i] = 0
	i+=1
	i = i%len(a)
	while val > 0:
		a[i] += 1
		val -= 1
		i += 1
		i = i%len(a)
	return a

def main():
	arr =[4,1,15,12,0,9,9,5,5,8,7,3,14,5,12,3]
	used = []
	used.append(''.join(str(e) for e in arr))
	i = 0
	while True:
		i+=1
		arr = make_round(arr)
		print arr
		used.append(''.join(str(e) for e in arr))
		if has_duplicates(used):
			break

	print i
	print len(used) - used.index(''.join(str(e) for e in arr)) - 1
	print arr

if __name__ == "__main__":
	main()

