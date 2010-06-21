dnl $Id: check-bsps.m4,v 1.33 2007/08/10 08:14:46 thomas Exp $

dnl See if FTPD is supported.
dnl
dnl RTEMS_CHECK_FTPD()
AC_DEFUN([RTEMS_CHECK_FTPD],
[
  AC_REQUIRE([RTEMS_ENABLE_RTEMSBSP])dnl sets RTEMS_BSP_INC

  AC_MSG_CHECKING([for FTPD])

  AS_IF([test -f ${RTEMS_BSP_INC}/rtems/ftpd.h],
        [RTEMS_HAS_FTPD=yes],
        [RTEMS_HAS_FTPD=no])

  AM_CONDITIONAL(RTEMS_HAS_FTPD, test x"${RTEMS_HAS_FTPD}" = x"yes")

  AC_MSG_RESULT(${RTEMS_HAS_FTPD})
])dnl
