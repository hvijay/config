#!/usr/bin/env bash

find . -name \*.[ch] > cscope.files
find . -name \*.java >> cscope.files
find . -name \*.cpp >> cscope.files
find . -name \*.c++ >> cscope.files

ctags -L cscope.files
cscope -b
cscope -d
