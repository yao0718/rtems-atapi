dnl $Id: check-bsps.m4,v 1.33 2007/08/10 08:14:46 thomas Exp $

dnl Report all available bsps for a target within the source tree
dnl
dnl RTEMS_CHECK_BSPS(bsp_list)
AC_DEFUN([RTEMS_CHECK_BSPS],
[
AC_REQUIRE([RTEMS_CANONICAL_TARGET_CPU])dnl sets RTEMS_CPU, target
AC_REQUIRE([RTEMS_TOP])dnl sets RTEMS_TOPdir
AC_REQUIRE([RTEMS_RTEMSPATH])dnl sets RTEMSPATH

AC_MSG_CHECKING([for available BSPs])
  $1=
  bsps=`ls "${RTEMSPATH}/make/custom/*.cfg 2>/dev/null` | sed -e "s,default.cfg,,"
  $1="[$]$1 $bsps"
  AS_IF([test -z "[$]$1"],
    [AC_MSG_RESULT([none])],
    [AC_MSG_RESULT([$]$1)])
])dnl
