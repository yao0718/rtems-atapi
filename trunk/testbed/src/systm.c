
#include <stdio.h>
#include <sys/kernel.h> 
#include <sys/malloc.h> 
#include <sys/errno.h>
#include <rtems/bsd/sys/queue.h>
#include "../sys/quirk.h"
#include "../sys/device.h"

/*The aprint_*() functions have the following behaviour, based on the above mentioned flags:*/

/*NetBSD:Sends to the console unless AB_QUIET is set.  Always sends to the log*/
void aprint_normal(const char *fmt, ...){
  printf(fmt);
  return;
}
/*NetBSD: Sends to the console only if AB_VERBOSE is set. Always sends to the log*/
void aprint_verbose(const char *fmt, ...){
  printf(fmt);
  return;
}

/*NetBSD:Sends to the console only if AB_VERBOSE is set. Always sends to the log*/
void aprint_naive(const char *fmt, ...){
  printf(fmt);
  return;
}

void aprint_error_dev(device_t dv, const char *fmt, ...){
  
  printf("Device %s:", dv->dv_xname);
  printf(fmt);
  return;
}

void aprint_verbose_dev(device_t dv, const char *fmt, ...){
  
  printf("Device %s:", dv->dv_xname);
  printf(fmt);
  return;
}

int enodev(void){
  
  return ENODEV;
  
}

int seltrue(void){
  
  return 0;
  
}