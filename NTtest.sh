for num1 in 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
#for num1 in 16 18 20
do
make TARGET=run cp_option="-o para -DNT=$num1"
echo $num1
sleep 2
./para >> ./NTtest4times.txt
sleep 2
./para >> ./NTtest4times.txt
sleep 2
./para >> ./NTtest4times.txt
sleep 2
./para >> ./NTtest4times.txt
done
