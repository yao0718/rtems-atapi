/*
 *  $Id$
 *
 * RTEMS Project (http://www.rtems.org/)
 *
 * Copyright 2007 Chris Johns (chrisj@rtems.org)
 */

/**
 * File-system block driver test program.
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>

#include <rtems.h>
#include <rtems/bdbuf.h>
#include <rtems/blkdev.h>
#include <rtems/diskdevs.h>
#include <rtems/dosfs.h>
#include <rtems/error.h>
#include <rtems/nvdisk.h>
#include <rtems/fsmount.h>
#include <rtems/ramdisk.h>
#include <rtems/shell.h>
#include <rtems/untar.h>


#if RTEMS_APP_FLASHDISK
#include <rtems/flashdisk.h>
#include <libchip/am29lv160.h>
#endif

#if RTEMS_APP_IDEDISK
#include <libchip/ide_ctrl.h>
#include <libchip/ata.h>
#endif

#if pc586
#include "pc386-gdb.h"
int remote_debug;
#endif


/**
 * Start the RTEMS Shell.
 */
void
shell_start (void)
{
  rtems_status_code sc;
  printf ("Starting shell....\n\n");
  sc = rtems_shell_init ("fstst", 60 * 1024, 150, "/dev/console", 0, 1, NULL);
  if (sc != RTEMS_SUCCESSFUL)
    printf ("error: starting shell: %s (%d)\n", rtems_status_text (sc), sc);
}


int
main (int argc, char* argv[])
{
  struct termios term;
  int            ret;

//#if pc586
  //int arg;
  //for (arg = 1; arg < argc; arg++)
    //if (strcmp (argv[arg], "--gdb") == 0)
      pc386_gdb_init ();
//#endif

  if (tcgetattr(fileno(stdout), &term) < 0)
    printf ("error: cannot get terminal attributes: %s\n", strerror (errno));
  cfsetispeed (&term, B115200);
  cfsetospeed (&term, B115200);
  if (tcsetattr (fileno(stdout), TCSADRAIN, &term) < 0)
    printf ("error: cannot set terminal attributes: %s\n", strerror (errno));
  
  if (tcgetattr(fileno(stdin), &term) < 0)
    printf ("error: cannot get terminal attributes: %s\n", strerror (errno));
  cfsetispeed (&term, B115200);
  cfsetospeed (&term, B115200);
  if (tcsetattr (fileno(stdin), TCSADRAIN, &term) < 0)
    printf ("error: cannot set terminal attributes: %s\n", strerror (errno));
  
  printf ("\nRTEMS ATAPI/SATA" \
          PACKAGE_VERSION "\n\n");
  
  while (true)
    shell_start ();
  
  rtems_task_delete (RTEMS_SELF);

  return 0;
}

#if pc586
void
rtems_fatal_error_occurred (uint32_t code)
{
  printf ("fatal error: %08lx\n", code);
  for (;;);
}
#endif

