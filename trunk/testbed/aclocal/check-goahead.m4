dnl $Id: check-bsps.m4,v 1.33 2007/08/10 08:14:46 thomas Exp $

dnl See what HTTPD is supported.
dnl
dnl RTEMS_CHECK_HTTPD()
AC_DEFUN([RTEMS_CHECK_HTTPD],
[
  AC_REQUIRE([RTEMS_ENABLE_RTEMSBSP])dnl sets RTEMS_BSP_INC

  AC_MSG_CHECKING([for HTTPD])

  RTEMS_HAS_HTTPD=no
  RTEMS_HTTPD=

  AS_IF([test -f ${RTEMS_BSP_INC}/goahead/webs.h],
        [RTEMS_HAS_HTTPD=yes
         RTEMS_HAS_HTTPD_GOAHEAD=yes
         RTEMS_HTTPD="GoAhead ${RTEMS_HTTPD}"],
        [RTEMS_HAS_HTTPD_GOAHEAD=no])

  AS_IF([test -f ${RTEMS_BSP_INC}/shttpd/shttpd.h],
        [RTEMS_HAS_HTTPD=yes
         RTEMS_HAS_HTTPD_SHTTPD=yes
         RTEMS_HTTPD="SimpleHTTPD ${RTEMS_HTTPD}"],
        [RTEMS_HAS_HTTPD_SHTTPD=no])

  AM_CONDITIONAL(RTEMS_HAS_HTTPD, test x"${RTEMS_HAS_HTTPD}" = x"yes")
  AM_CONDITIONAL(RTEMS_HAS_HTTPD_GOAHEAD, test x"${RTEMS_HAS_HTTPD_GOAHEAD}" = x"yes")
  AM_CONDITIONAL(RTEMS_HAS_HTTPD_SHTTPD, test x"${RTEMS_HAS_HTTPD_SHTTPD}" = x"yes")

  AC_MSG_RESULT(${RTEMS_HTTPD})
])dnl
