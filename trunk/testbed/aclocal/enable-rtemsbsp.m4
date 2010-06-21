dnl $Id: enable-rtemsbsp.m4,v 1.14 2004/02/17 13:50:24 ralf Exp $

dnl Override the set of BSPs to be built.
dnl used by the toplevel configure script
dnl RTEMS_ENABLE_RTEMSBSP(rtems_bsp_list)
AC_DEFUN([RTEMS_ENABLE_RTEMSBSP],
[
AC_BEFORE([$0], [RTEMS_ENV_RTEMSBSP])
AC_REQUIRE([RTEMS_CANONICAL_TARGET_CPU])dnl sets RTEMS_CPU, target
AC_REQUIRE([RTEMS_RTEMSPATH])dnl sets RTEMSPATH

AC_ARG_ENABLE(rtemsbsp,
[AC_HELP_STRING([--enable-rtemsbsp="bsp1"],
[BSPs to include in build])],
[case "${enable_rtemsbsp}" in
  yes ) enable_rtemsbsp="no" ;;
  no ) enable_rtemsbsp="no" ;;
  *) enable_rtemsbsp="$enable_rtemsbsp" ;;
esac],[enable_rtemsbsp="no"])

AS_IF([test x"$enable_rtemsbsp" = x"no"],[
  AC_MSG_ERROR([no valid BSP provided, use --enable-rtemsbsp="bsp"])
])

RTEMS_COMPILER=${RTEMSPATH}/make/compilers/gcc-target-default.cfg
RTEMS_BSP=$enable_rtemsbsp
RTEMS_BSP_PATH=${RTEMSPATH_CPUAPI}/${enable_rtemsbsp}
RTEMS_BSP_BSPCFG=${RTEMS_BSP_PATH}/make/bsp.cfg
RTEMS_BSP_MAKECFG=${RTEMSPATH}/make/custom/${enable_rtemsbsp}.cfg
RTEMS_BSP_INC=${RTEMS_BSP_PATH}/lib/include

AC_MSG_CHECKING([for BSP ${RTEMS_BSP}])

AS_IF([test ! -f ${RTEMS_BSP_BSPCFG}],[
  AC_MSG_RESULT([not found])
  AC_MSG_ERROR([no valid BSP configuration file found: ${RTEMS_BSP_BSPCFG}])
])

AS_IF([test ! -f ${RTEMS_BSP_MAKECFG}],[
  AC_MSG_RESULT([not found])
  AC_MSG_ERROR([no valid BSP custom make configuration file found: ${RTEMS_BSP_MAKECFG}])
])

AS_IF([test ! -f ${RTEMS_BSP_INC}/bsp.h],[
  AC_MSG_RESULT([not found])
  AC_MSG_ERROR([no valid BSP header found: ${RTEMS_BSP_INC}/bsp.h])
])

AS_IF([test ! -f ${RTEMS_BSP_INC}/rtems.h],[
  AC_MSG_RESULT([not found])
  AC_MSG_ERROR([no valid RTEMS header found: ${RTEMS_BSP_INC}/rtems.h])
])

AS_IF([test ! -f ${RTEMS_BSP_INC}/rtems/rtems/status.h],[
  AC_MSG_RESULT([not found])
  AC_MSG_ERROR([no valid RTEMS header found: ${RTEMS_BSP_INC}/rtems/rtems/status.h])
])

AC_MSG_RESULT([found])

AC_SUBST(RTEMS_COMPILER)
AC_SUBST(RTEMS_BSP)
AC_SUBST(RTEMS_BSP_BSPCFG)
AC_SUBST(RTEMS_BSP_MAKECFG)
AC_SUBST(RTEMS_BSP_INC)

])

