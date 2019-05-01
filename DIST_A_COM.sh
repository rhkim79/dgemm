MR=32
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $MR \* 1`
for num1 in 2 4 6 8 10 12 14 16 18 20 22 24 
do
flnm=`expr 1000000000 + $num1 \* 100000`
echo $flnm
KB=`expr $num1 \* $MR`
make TARGET=run cp_option="-o $flnm -DL1_DIST_A=$KB"
done

