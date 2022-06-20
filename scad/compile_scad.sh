cp ./$1.scad ./$1.c 
gcc -E ./$1.c -o ./$1.i 
mv ./$1.i ./p$1.scad