dnl $Id: rtems-top.m4,v 1.23 2006/10/18 03:35:00 ralf Exp $

dnl
dnl RTEMS_PACKAGE_TOP($1, $2, $3)
dnl 
dnl $1 .. the package name
dnl $2 .. version
dnl $3 .. relative path from this configure.in to the toplevel configure.in
dnl
AC_DEFUN([RTEMS_PACKAGE_TOP],
[dnl
AC_REQUIRE([RTEMS_VERSIONING])
AC_REQUIRE([RTEMS_PACKAGE_VERSIONING])
AC_CONFIG_AUX_DIR([$3])
AC_CHECK_PROGS(MAKE, gmake make)
AC_BEFORE([$0], [AM_INIT_AUTOMAKE])dnl

AC_PREFIX_DEFAULT([/opt/rtems-][RTEMS_API])

RTEMS_TOPdir="$3";
AC_SUBST(RTEMS_TOPdir)

dots=`echo $with_target_subdir|\
sed -e 's,^\.$,,' -e 's%^\./%%' -e 's%[[^/]]$%&/%' -e 's%[[^/]]*/%../%g'`
PROJECT_TOPdir=${dots}${RTEMS_TOPdir}/'$(top_builddir)'
AC_SUBST(PROJECT_TOPdir)

PROJECT_ROOT="${RTEMS_TOPdir}/\$(top_builddir)"
AC_SUBST(PROJECT_ROOT)

AC_MSG_CHECKING([for RTEMS $1 Version])
AC_MSG_RESULT([$2])
])dnl
