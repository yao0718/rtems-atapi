## Process this file with autoconf to produce a configure script.
## 
## $Id$

AC_PREREQ(2.61)
AC_INIT([filesystem-test],[1.0.0],[http://www.rtems.org/bugzilla])
AC_CONFIG_SRCDIR([main.c])
RTEMS_PACKAGE_TOP([File System Test], [1.0.0], [.])

RTEMS_CANONICAL_TARGET_CPU

AM_INIT_AUTOMAKE([no-define foreign dist-bzip2 no-dist-gzip 1.10])
AM_MAINTAINER_MODE

RTEMS_RTEMSPATH
RTEMS_ENABLE_RTEMS_DEBUG
RTEMS_ENABLE_RTEMSBSP

RTEMS_PROG_CC_FOR_TARGET([-fasm])
RTEMS_PROG_CCAS
RTEMS_CANONICALIZE_TOOLS
AM_PROG_CC_C_O
AC_PROG_RANLIB

AC_HEADER_STAT
AC_CHECK_HEADERS([errno.h netinet/in.h sys/stat.h sys/types.h unistd.h])
AC_DEFINE([HAVE_NETINET_IN_H], [1])

RTEMS_OBJECT_FORMAT
RTEMS_ENABLE_NETWORKING

AC_ARG_ENABLE(flashdisk,
AC_HELP_STRING([--enable-flashdisk],[enable flashdisk]),
[case "${enable_flashdisk}" in
  yes) enable_flashdisk=yes ;;
  no)  enable_flashdisk=no ;;
  *) AC_MSG_ERROR([bad value ${enable_flashdisk} for flashdisk]) ;;
esac],
[enable_flashdisk=yes])
AS_IF([test x"${enable_flashdisk}" = x"yes"],
      [RTEMS_APP_FLASHDISK=1],[RTEMS_APP_FLASHDISK=0])
AC_MSG_CHECKING([for flashdisk support])
AC_MSG_RESULT([${enable_flashdisk}])

AM_CONDITIONAL(PC586, test x"${RTEMS_BSP}" = x"pc586")

AS_IF([test x"${RTEMS_BSP}" = x"pc586"], 
      [RTEMS_APP_IDEDISK=1],
      [RTEMS_APP_IDEDISK=0])

RTEMS_CPPFLAGS="${RTEMS_CPPFLAGS} -DRTEMS_APP_FLASHDISK=${RTEMS_APP_FLASHDISK}"
RTEMS_CPPFLAGS="${RTEMS_CPPFLAGS} -DRTEMS_APP_IDEDISK=${RTEMS_APP_IDEDISK}"
RTEMS_CPPFLAGS="${RTEMS_CPPFLAGS} -D${RTEMS_BSP}=1"

## ext2fs configuration
AC_CHECK_HEADERS([getopt.h stdlib])
AC_CHECK_FUNCS(chflags getrusage llseek open64 fstat64 ftruncate64 getmntinfo \
	       strtoull strcasecmp srandom jrand48 fchown mallinfo fdatasync strnlen\
	       strptime strdup sysconf pathconf posix_memalign memalign valloc \
	       __secure_getenv prctl mmap utime setresuid setresgid usleep nanosleep \
	       getdtablesize getrlimit)
AC_SUBST(ASM_TYPES_HEADER, [])
AC_SUBST(PUBLIC_CONFIG_HEADER, [])
AC_CHECK_SIZEOF(short)
AC_CHECK_SIZEOF(int)
AC_CHECK_SIZEOF(long)
AC_CHECK_SIZEOF(long long)
AC_SUBST(SIZEOF_SHORT, $ac_cv_sizeof_short)
AC_SUBST(SIZEOF_INT, $ac_cv_sizeof_int)
AC_SUBST(SIZEOF_LONG, $ac_cv_sizeof_long)
AC_SUBST(SIZEOF_LONG_LONG, $ac_cv_sizeof_long_long)
AC_CHECK_TYPE(ssize_t,[AC_DEFINE(HAVE_TYPE_SSIZE_T)], , [#include <sys/types.h>])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
