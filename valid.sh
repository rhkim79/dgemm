export KMP_AFFINITY=$NULL
export OMP_NESTED=1
export KMP_HOT_TEAMS_MODE=1
export KMP_HOT_TEAMS_MAX_LEVEL=2
export OMP_PLACES="cores"
export OMP_PROC_BIND=spread,close

#TEST ENVIRONMENT VARIABLES
export OMP_STACKSIZE="64M"
#export KMP_STACKSIZE="16M"
make TARGET=my cp_option='-o valid '
sleep 2
./valid
