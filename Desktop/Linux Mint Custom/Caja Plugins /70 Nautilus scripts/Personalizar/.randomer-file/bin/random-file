#!/usr/bin/env python
#
# random-file
#
# Description: Select a random file from a directory
# Version: 1.0
#
# Copyright (C) 2012 - K-Gigas Computers S.L.
# Danilo Dellaquila <ddellaquila@gmail.com>
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This file is part of @ddellaquila/dd-repo
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import argparse
import os, sys
import random

args=None

def check_args():
    global args

    parser = argparse.ArgumentParser(description='Select a random file from a directory.')
    parser.add_argument('directory', help='a directory where to select a file',
                        nargs='?', default=".")
    parser.add_argument('-v', '--verbose', help='print verbose output',
                        action='store_true')
    parser.add_argument('--version', action='version', version='%(prog)s 1.0')
    parser.add_argument('--license', help='show license informations',
                        action='store_true',)

    args = parser.parse_args()
    if args.verbose:
        print "Verbose: " + str(args.verbose)
        print "License: " + str(args.license)
        print "Directory: " + args.directory

    if args.license:
       print '''
random-file 1.0

Copyright (C) 2012 - K-Gigas Computers S.L.
Danilo Dellaquila <ddellaquila@gmail.com>

This is free software: you are free to change and redistribute it.
There is ABSOLUTELY NO WARRANTY, to the extent permitted by law.
Licence GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       '''
       sys.exit()


def main():

    check_args()
    directory = args.directory
    wallpaper = random.choice(os.listdir(directory))

    print os.path.abspath(args.directory + "/" + wallpaper)


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt, e: # Ctrl-C
        raise e
    except SystemExit, e: # sys.exit()
        raise e
