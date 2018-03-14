def write(name, data):
    f = open(name, "a")
    f.write(data)
    f.close()
