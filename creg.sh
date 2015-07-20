#!/bin/sh                                                                                                                       

# Script that generates an arch-relevant code-only cscope.files

find . -name \*.[chxsS] > .tmp

archs=`ls arch`
echo > .tmp2
cmd="cat .tmp"
for f in $archs
do
    if [ $f != "x86" ]
    then
        cmd="$cmd | grep -v arch/$f"
    fi 
done
cmd="$cmd > .tmp2"
echo $cmd > cmd_to_exec
sh cmd_to_exec
grep -v Documentation .tmp2 | grep -v scripts/ | grep -v "\.mod.c" > cscope.files
rm .tmp .tmp2
ctags -L cscope.files
cscope -b
cscope -d
