#! /bin/bash
mpicc -O3 -march=armv8.2-a -fopenmp miniGMG.c mg.c box.c solver.c operators.avx.c timer.x86.c -lm -Daarch64 -D__MPI -D__COLLABORATIVE_THREADING=6 -D__TEST_MG_CONVERGENCE -D__PRINT_NORM -D__USE_BICGSTAB  -o run.minigmg.simde.native

mpicc -O3 -Ofast -march=armv8.2-a -fopenmp \
    miniGMG.c mg.c box.c solver.c operators.avx.c timer.x86.c -lm\
    -Daarch64 -D__MPI -D__TEST_MG_CONVERGENCE -D__PREFETCH_NEXT_PLANE_FROM_DRAM -D__FUSION_RESIDUAL_RESTRICTION -D__PRINT_NORM -D__USE_BICGSTAB\
    -o run.minigmg.simde.opt_all

mpicc -O3 -fopenmp \
    miniGMG.c mg.c box.c solver.c operators.ompif.c timer.x86.c -lm -Daarch64 -D__MPI -D__COLLABORATIVE_THREADING=6 -D__TEST_MG_CONVERGENCE -D__PRINT_NORM -D__USE_BICGSTAB -o run.minigmg.native
