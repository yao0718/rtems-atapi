# $Id$

AC_DEFUN([RTEMS_OBJECT_FORMAT], 
[
  AC_MSG_CHECKING([for object file format])

  save_CFLAGS="$CFLAGS"
  CFLAGS="$CFLAGS -c -o conftest.o"
  AC_TRY_COMPILE([],[],
    [RTEMS_OBJ_FORMAT=`${OBJDUMP} -f conftest.o | grep .o: | sed -e "s/^.*format //"`],
    [RTEMS_OBJ_FORMAT=none])

  CFLAGS="$save_CFLAGS"

  AC_MSG_RESULT([$RTEMS_OBJ_FORMAT])

  AC_SUBST(RTEMS_OBJ_FORMAT)
])
