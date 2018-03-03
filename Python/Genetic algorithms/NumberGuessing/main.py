import sys, getopt


def extract_number(argv):
    number = 0
    try:
        opts, args = getopt.getopt(argv, 'n:', ['number='])
    except getopt.GetoptError:
        print('-n <number>')
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            print('-n <number>')
            sys.exit()
        elif opt in ('-n', 'number'):
            number = arg
        else:
            print('Unknown option ' + str(opt))

    return number


def main(argv):
    number = extract_number(argv)


if __name__ == "__main__":
    main(sys.argv[1:])
