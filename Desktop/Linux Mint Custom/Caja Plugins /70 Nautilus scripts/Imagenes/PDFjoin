#!/usr/bin/python
# Join several pdf
# by invoking pdftk
# Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>

from os import execvp
from sys import argv

if len(argv) < 2:
	print 'At least two files to join'
	sys.exit()
argumentos=[]
argumentos.append('pdftk')
argumentos+=argv[1:]
argumentos.append('cat')
argumentos.append('output')
argumentos.append('join.pdf')
print 'File created: join.pdf'
execvp('pdftk',argumentos)
