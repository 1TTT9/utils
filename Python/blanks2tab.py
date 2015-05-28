import re

"""
  Problem: How to trim multiple blanks between words and convert file to tsv or csv format file
  Solution: Use 're' library 
  Reference: [from Satckoverflow](http://stackoverflow.com/questions/1546226/a-simple-way-to-remove-multiple-spaces-in-a-string-in-python)
  Date: 2015-05-28
"""

def main():

	fname = "tmp.txt"

	fd = open(fname, 'rb')

	lines = []
	while True:
		line = fd.readline()
		if not line:
			break

		line = re.sub(' +', '\t', line)
		lines.append(line)

	with open(fname, 'wb') as fd:
		fd.write(''.join(lines))

if __name__ == '__main__':
	main()
