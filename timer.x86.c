//------------------------------------------------------------------------------------------------------------------------------
// Samuel Williams
// SWWilliams@lbl.gov
// Lawrence Berkeley National Lab
//------------------------------------------------------------------------------------------------------------------------------
#include <stdint.h>


uint64_t CycleTime(){
#ifdef aarch64
  uint64_t val;
    asm volatile("mrs %0, cntvct_el0" : "=r" (val));

  return val;
#else
  uint64_t lo, hi;
  __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
  return( (((uint64_t)hi) << 32) | ((uint64_t)lo) );
#endif
}


