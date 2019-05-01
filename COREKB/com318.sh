MR=31
NR=8
#for num1 in 384 416 448 480 512 544 576
MB=`expr $MR \* 4`
#for num1 in 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 
#for num1 in 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
#for num1 in 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44
for num1 in 20 21 22 23 24 25 26 27 28 29 30 31
do
flnm=`expr 1000000000 + $num1 \* 100000`
echo $flnm
sleep 2
./$flnm >> ./KBtest2.txt
sleep 2
./$flnm >> ./KBtest2.txt
sleep 2
./$flnm >> ./KBtest2.txt
sleep 2
./$flnm >> ./KBtest2.txt
done

