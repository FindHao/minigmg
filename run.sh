#! /bin/bash
export OMP_NUM_THREADS=64
# export OMP_DYNAMIC=FALSE
# export KMP_SCHEDULE=static,balanced
# export GOMP_CPU_AFFINITY="0-63"


log2BoxSize=6 
BoxesPerProcess_i=4
BoxesPerProcess_j=4
BoxesPerProcess_k=4
Processes_i=1
Processes_j=1
Processes_k=1
echo "native"
time (./run.minigmg.native $log2BoxSize \
    $BoxesPerProcess_i $BoxesPerProcess_j $BoxesPerProcess_k \
    $Processes_i $Processes_j $Processes_k \
    > native.log)

export OMP_WAIT_POLICY=ACTIVE

echo "simde.opt_all"
log2BoxSize=6 
BoxesPerProcess_i=4
BoxesPerProcess_j=4
BoxesPerProcess_k=4
Processes_i=1
Processes_j=1
Processes_k=1
time (./run.minigmg.simde.optall $log2BoxSize \
    $BoxesPerProcess_i $BoxesPerProcess_j $BoxesPerProcess_k \
    $Processes_i $Processes_j $Processes_k \
    > simde.optall.log)