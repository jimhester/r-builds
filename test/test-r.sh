#!/usr/bin/env bash
set -ex

R_HOME=/opt/R/${R_VERSION}/lib/R
${R_HOME}/bin/R --version
${R_HOME}/bin/Rscript -e 'sessionInfo()'

# List R devel dependencies
gcc --version
g++ --version
gfortran --version

# List shared library dependencies (e.g. BLAS/LAPACK)
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${R_HOME}/lib ldd ${R_HOME}/lib/libR.so

${R_HOME}/bin/Rscript /test/test.R
