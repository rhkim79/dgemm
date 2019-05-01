#MR=31
#NR=8
#for num1 in 384 416 448 480 512 544 576
#MB=`expr $MR \* 1`
for num1 in 23 24 25 26 27 28 29 30 31 32
do
flnm=`expr 1000000000 + $num1 \* 100000`
echo $flnm
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
./$flnm >> 31x8PadKBOPTI.txt
sleep 2
done

for num1 in 23 24 25 26 27 28 29 30 31 32
do
flnm=`expr 2000000000 + $num1 \* 100000`
echo $flnm
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
./$flnm >> 31x8PadKBOPTI2.txt
sleep 2
done

