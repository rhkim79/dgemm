MR=32
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $MR \* 1`
for num1 in 18 20 22 24 26 28 30
do
flnm=`expr 1000000000 + $num1 \* 100000`
echo $flnm
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
./$flnm >> ./DISTBTEST.txt
sleep 2
done

