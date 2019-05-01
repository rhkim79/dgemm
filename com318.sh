MR=31
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $MR \* 4`
#for num1 in 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 
for num1 in 45 46 47 48 49 50 51 52 53 54 55
do
flnm=`expr 2000000000 + $num1 \* 100000`
echo $flnm
KB=`expr $num1 \* 8`
make TARGET=run cp_option="-o $flnm -DKB=$KB"
done

