/*	$NetBSD: device_if.h,v 1.5 2010/02/24 22:38:10 dyoung Exp $	*/

#ifndef	_SYS_DEVICE_IF_H
#define	_SYS_DEVICE_IF_H

#ifdef _KERNEL
typedef enum devact_level {
	  DEVACT_LEVEL_CLASS	= 0
	, DEVACT_LEVEL_DRIVER	= 1
	, DEVACT_LEVEL_BUS	= 2
} devact_level_t;

#define	DEVACT_LEVEL_FULL	DEVACT_LEVEL_CLASS

struct device_lock;
struct device_suspensor;

typedef uint64_t devgen_t;

typedef struct device_lock *device_lock_t;
typedef struct device_suspensor device_suspensor_t;
#endif

#endif	/* _SYS_DEVICE_IF_H */