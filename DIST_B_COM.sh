MR=32
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $NR \* 1`
for num1 in 18 20 22 24 26 28 30
do
flnm=`expr 1000000000 + $num1 \* 100000`
echo $flnm
KB=`expr $num1 \* $NR`
make TARGET=run cp_option="-o $flnm -DL1_DIST_B=$KB"
done

