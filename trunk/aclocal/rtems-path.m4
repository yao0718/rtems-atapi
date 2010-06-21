dnl $Id$

dnl
dnl RTEMS_RTEMSPATH
dnl
AC_DEFUN([RTEMS_RTEMSPATH],
[dnl
AC_REQUIRE([RTEMS_CANONICAL_TARGET_CPU])dnl sets RTEMS_CPU, target

AC_MSG_CHECKING([for RTEMS])

RTEMSPATH=${prefix}
RTEMSPATH_CPUAPI=[${RTEMSPATH}/${host_alias}]

AS_IF([test ! -d ${RTEMSPATH}],
      AC_MSG_RESULT([not found])
      AC_MSG_ERROR([invalid path to RTEMS: ${RTEMSPATH}]))

AS_IF([test ! -d ${RTEMSPATH}/bin],
      AC_MSG_RESULT([not found])
      AC_MSG_ERROR([invalid path to RTEMS bin: ${RTEMSPATH}/bin]))

AC_MSG_RESULT([$RTEMSPATH])

AC_SUBST(RTEMSPATH)
AC_SUBST(RTEMS_ROOT, $RTEMSPATH)
AC_SUBST(RTEMSPATH_CPUAPI)

])