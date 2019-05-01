MR=31
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $MR \* 1`
for num1 in 2 3 4
do
for num2 in 4 8 16 32
do
flnm=`expr 1000000000 + $num1 \* 100000 + $num2`
echo $flnm
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
./$flnm >> ./NTNUOPTI.txt
sleep 2
done
done

