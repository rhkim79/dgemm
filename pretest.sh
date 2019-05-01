for num1 in 4 6 8 10 12 14 16 18 20 22 24 26 28 30
#for num1 in 16 18 20
do
make TARGET=run cp_option="-o para -DPREFX_L1=$num1"
sleep 2
./para
sleep 2
./para
sleep 2
./para
sleep 2
./para
done
