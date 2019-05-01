srcs = $(addprefix ./src/, generators.c avx512.c)

objects = $(srcs:.c=.o)

CC = icc
CFLAGS = $(inc) $(flag) $(cp_option)
TARGET =
output = .
#flag = -restrict -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl
#flag = -qopenmp -lmemkind -O2 -xMIC-AVX512 -mkl -auto-p32# -Ofast 
flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl #-auto-p32# -qno-opt-prefetch #-ffast-math # -Ofast 
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -qopt-threads-per-core=4 # 1,2,3,4
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -fcode-asm
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -S
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -qopt-report=5 -vec -simd #This is used for advisor vectorflow
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -I/opt/intel/advisor/include -Bdynamic -ldl #This option is used for advisor threadingflow
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -qopt-report=5 -simd -I/opt/intel/advisor/include -Bdynamic -ldl
#flag = -qopenmp -lmemkind -O3 -xMIC-AVX512 -mkl -g -shared-intel -debug inline-debug-info -qopenmp-link dynamic -parallel-sourse-info=2
inc = -I$(CURDIR)/src -I$(CURDIR)

$(TARGET) : $(objects) $(TARGET).c
	$(CC) -o $(TARGET) $(inc) $(srcs) $(TARGET).c $(flag) $(cp_option)

#vec : $(objects) $(TARGET).c
#	$(CC) -o $(TARGET) $(inc) $(srcs) $(TARGET).c $(flag) $(cp_vec)

#thd : $(objects) $(TARGET).c
#	$(CC) -o $(TARGET) $(inc) $(srcs) $(TARGET).c $(flag) $(cp_thd)

#vtune : $(objects) $(TARGET).c
#	$(CC) -o $(TARGET) $(inc) $(srcs) $(TARGET).c $(flag) $(cp_vtune)

clean :
	rm -rf src/*.o
