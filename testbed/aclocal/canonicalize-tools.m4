dnl
dnl $Id: canonicalize-tools.m4,v 1.4 2003/11/26 06:56:28 ralf Exp $
dnl
dnl Set target tools
dnl

AC_DEFUN([RTEMS_CANONICALIZE_TOOLS],
[AC_REQUIRE([RTEMS_PROG_CC])dnl

dnl FIXME: What shall be done if these tools are not available?
  RTEMS_CHECK_TOOL(AR,ar,no)

dnl special treatment of ranlib
  RTEMS_CHECK_TOOL(RANLIB,ranlib,:)

dnl special treatment of ranlib
  RTEMS_CHECK_TOOL(OBJDUMP,objdump,no)

dnl special treatment of ranlib
  RTEMS_CHECK_TOOL(OBJCOPY,objcopy,no)
])
