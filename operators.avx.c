//------------------------------------------------------------------------------------------------------------------------------
// Samuel Williams
// SWWilliams@lbl.gov
// Lawrence Berkeley National Lab
//------------------------------------------------------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
// #include <immintrin.h>
#define SIMDE_ENABLE_NATIVE_ALIASES
#define _MM_HINT_T0 1
#include "simde/x86/avx2.h"
//------------------------------------------------------------------------------------------------------------------------------
#include "timer.h"
#include "defines.h"
#include "box.h"
#include "mg.h"
#include "operators.h"
//------------------------------------------------------------------------------------------------------------------------------
#include "operators.ompif/exchange_boundary.c"
#include "operators.ompif/lambda.c"
#include "operators.avx/gsrb.c"
#include "operators.ompif/apply_op.c"
#include "operators.ompif/residual.c"
#include "operators.ompif/restriction.c"
#include "operators.ompif/interpolation.c"
#include "operators.ompif/misc.c"
#include "operators.ompif/matmul.c"
#include "operators.ompif/problem1.c"
//------------------------------------------------------------------------------------------------------------------------------
