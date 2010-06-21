## $Id: enable-rtems-debug.m4,v 1.2 2003/11/26 05:32:03 ralf Exp $

AC_DEFUN([RTEMS_ENABLE_NETWORKING],
[
AC_ARG_ENABLE(networking,
AC_HELP_STRING([--enable-networking],[enable networking]),
[networking_mode="DHCP"
 case "${enable_networking}" in
  static)
    enable_networking=yes
    networking_mode="static" ;;
  dhcp)
    enable_networking=yes
    networking_mode="DHCP" ;;
  yes) enable_networking=yes ;;
  no)  enable_networking=no ;;
  *) AC_MSG_ERROR([bad value ${enable_networking} for networking]) ;;
esac],[enable_networking=yes])

AS_IF([test x"${enable_networking}" = x"yes"],
      [RTEMS_APP_NETWORKING=1
       AS_IF([test x"${networking_mode}" = x"static"],
             [RTEMS_APP_NETWORKINS_STATIC=1
              RTEMS_CPPFLAGS="${RTEMS_CPPFLAGS} -DRTEMS_APP_NETWORKING_STATIC=1"])
       AS_IF([test x"${networking_mode}" = x"DHCP"],
             [RTEMS_APP_NETWORKINS_DHCP=1
              RTEMS_CPPFLAGS="${RTEMS_CPPFLAGS} -DRTEMS_APP_NETWORKING_DHCP=1"])
      ],[RTEMS_APP_NETWORKING=0
         networking_mode="none"])

AC_MSG_CHECKING([for networking])
AC_MSG_RESULT([${enable_networking} (${networking_mode})])

AC_SUBST(RTEMS_APP_NETWORKING)
AM_CONDITIONAL(RTEMS_APP_NETWORKING, test x"${enable_networking}" = x"yes")
AM_CONDITIONAL(RTEMS_APP_NETWORKING_STATIC, test x"${networking_mode}" = x"static")
AM_CONDITIONAL(RTEMS_APP_NETWORKING_DHCP, test x"${networking_mode}" = x"DHCP")

RTEMS_CPPFLAGS="${RTEMS_CPPFLAGS} -DRTEMS_APP_NETWORKING=${RTEMS_APP_NETWORKING}"

])
