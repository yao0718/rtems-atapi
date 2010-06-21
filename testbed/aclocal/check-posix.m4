dnl $Id: check-bsps.m4,v 1.33 2007/08/10 08:14:46 thomas Exp $

dnl See if POSIX is supported.
dnl
dnl RTEMS_CHECK_POSIX()
AC_DEFUN([RTEMS_CHECK_POSIX],
[
  AC_REQUIRE([RTEMS_ENABLE_RTEMSBSP])dnl sets RTEMS_BSP_INC

  AC_MSG_CHECKING([for POSIX])

  AS_IF([test -f ${RTEMS_BSP_INC}/rtems/posix/posixapi.h],
        [RTEMS_HAS_POSIX_API=yes],
        [RTEMS_HAS_POSIX_API=no])

  AM_CONDITIONAL(RTEMS_HAS_POSIX_API, test x"${RTEMS_HAS_POSIX_API}" = x"yes")

  AC_MSG_RESULT(${RTEMS_HAS_POSIX_API})
])dnl
