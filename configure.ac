AC_INIT([R2GUESS], [0.9])

: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
    AC_MSG_ERROR([Could not determine R_HOME])
fi

CXX=`"${R_HOME}/bin/R" CMD config CXX`
CPPFLAGS=`"${R_HOME}/bin/R" CMD config CPPFLAGS`
LDFLAGS=`"${R_HOME}/bin/R" CMD config LDFLAGS`

AC_LANG([C++])

AC_PATH_PROG([GSL_CONFIG], [gsl-config])
if test -z "${GSL_CONFIG}"; then
    AC_MSG_ERROR([Could not find gsl-config])
fi

AC_MSG_CHECKING([if GSL version >= 1.12])

GSL_MAJOR=`${GSL_CONFIG} --version | \
           sed 's/^\([[0-9]]*\).*/\1/'`
if test -z "${GSL_MAJOR}"; then
    GSL_MAJOR=0
fi

GSL_MINOR=`${GSL_CONFIG} --version | \
           sed 's/^\([[0-9]]*\)\.\{0,1\}\([[0-9]]*\).*/\2/'`
if test -z "${GSL_MINOR}"; then
    GSL_MINOR=0
fi

if test "${GSL_MAJOR}" -eq "1" -a "${GSL_MINOR}" -ge "12"; then
    AC_MSG_RESULT([yes])
else
    AC_MSG_ERROR([Could not find required version of GSL])
fi

CPPFLAGS="${CPPFLAGS} `${GSL_CONFIG} --cflags`"
LIBS="${LIBS} `${GSL_CONFIG} --libs`"

AC_CHECK_HEADERS([cuda.h cula.h])
AC_CHECK_LIB([cuda], [cuInit])
AC_CHECK_LIB([cublas], [cublasDgemm])
AC_CHECK_LIB([cudart], [cublasDgemm])
AC_CHECK_LIB([cula_core], [culaGetErrorInfo])
AC_CHECK_LIB([cula_lapack], [culaDgemm])

if test "$ac_cv_header_cuda_h" == yes -a "$ac_cv_header_cula_h" == yes; then
    CPPFLAGS="$CPPFLAGS -D_CUDA_"
fi

AC_CONFIG_FILES(src/Makefile)

AC_OUTPUT

