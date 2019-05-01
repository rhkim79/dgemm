#export KMP_AFFINITY=$NULL
#export OMP_NESTED=1
#export KMP_HOT_TEAMS_MODE=1
#export KMP_HOT_TEAMS_MAX_LEVEL=2
#export OMP_PLACES="cores(68)"
#export OMP_PROC_BIND=spread,close
#export OMP_NUM_THREADS=17,4


#TEST ENVIRONMENT VARIABLES
#export OMP_STACKSIZE="64M"
#export KMP_STACKSIZE="72M"
#export OMP_DYNAMIC="true"
#export OMP_SCHEDULE="dynamic,4"
#export OMP_SCHEDULE="guided,4"
#export OMP_WAIT_POLICY="ACTIVE"
NT1=17
NT2=4

KB=432
L1_DIST_A=620
L1_DIST_B=160
MSIZE=20000
NSIZE=20000
NU=3

for num1 in 8000 
do
MSIZE=$num1
NSIZE=$num1
#make TARGET=run cp_option="-o para -DNT1=$NT1 -DNT2=$NT2 -DKB=$KB -DL1_DIST_A=${L1_DIST_A} -DL1_DIST_B=${L1_DIST_B} -DNB=$NB"
make TARGET=test cp_option="-o para -DMSIZE=${MSIZE} -DNSIZE=${MSIZE}"
sleep 2
./para
sleep 2
./para
sleep 2
./para
sleep 2
./para
sleep 2
./para
done
