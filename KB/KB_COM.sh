MR=31
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $MR \* 1`
for num1 in 23 24 25 26 27 28 29 30 31 32
do
flnm=`expr 1000000000 + $num1 \* 100000`
echo $flnm
KB=`expr $num1 \* 16`
make TARGET=run cp_option="-o $flnm -DKB=$KB"
done

