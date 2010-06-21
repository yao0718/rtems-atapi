/*
* Header with definitions from different sources
*
*/

//General Use
#define	_KERNEL
#define MAXHOSTNAMELEN 30
#define MAXPATHLEN 30

//Don't know where this is defined
#define ATACF_CHANNEL_DEFAULT 1
#define ATACF_CHANNEL 2

/******from machine/types.h********/
//for machine/bus.h
typedef unsigned long	paddr_t;
typedef unsigned long	psize_t;
typedef unsigned long	vaddr_t;
typedef unsigned long	vsize_t;

//for sys/simple_lock.h
typedef	volatile unsigned char		__cpu_simple_lock_t;
#define	__CPU_SIMPLE_LOCK_PAD
#define	__SIMPLELOCK_LOCKED	1
#define	__SIMPLELOCK_UNLOCKED	0

/*from sys/types.h*/
struct	lwp;
typedef struct lwp lwp_t;

//From sys/systm.h and kern/subr_prf.c
typedef struct device *device_t;
void	aprint_normal(const char *, ...)
    __attribute__((__format__(__printf__,1,2)));
    
void	aprint_error_dev(device_t , const char *, ...)
    __attribute__((__format__(__printf__,2,3)));
    
void	aprint_naive(const char *, ...)
    __attribute__((__format__(__printf__,1,2)));
    
void	aprint_verbose(const char *, ...)
    __attribute__((__format__(__printf__,1,2)));
    
void	aprint_verbose_dev(device_t , const char *, ...)
    __attribute__((__format__(__printf__,2,3)));
    
/*From sys/cdefs.h*/    
#define	__predict_true(exp)	__builtin_expect((exp) != 0, 1)
#define	__predict_false(exp)	__builtin_expect((exp) != 0, 0)

/*From somewhere to intr.h, maybe splraise() from machine/intr.h? */ 
#define splvm()  1

/* From proc.h */
#define ltsleep(a,b,c,d,e)
#define tsleep(a,b,c,d)
#define wakeup(a)

/*From machine/intrdefs.h*/
#define	IPL_VM		0x6	/* low I/O, memory allocation */

/*from param.h*/
/*********************************************************/
#define	PSWP	0
#define	PVM	4
#define	PINOD	8
#define	PRIBIO	16
#define	PVFS	20
#define	PZERO	22
#define	PSOCK	24
#define	PWAIT	32
#define	PLOCK	36
#define	PPAUSE	40
#define	PUSER	50
#define	MAXPRI	127

#define	PCATCH		0x100	/* OR'd with pri for tsleep to check signals */
#define	PNORELOCK	0x200	/* OR'd with pri for tsleep to not relock */

/*
 * New priority levels.
 */
#define	PRI_COUNT		224
#define	PRI_NONE		(-1)

#define	PRI_KERNEL_RT		192
#define	NPRI_KERNEL_RT		32
#define	MAXPRI_KERNEL_RT	(PRI_KERNEL_RT + NPRI_KERNEL_RT - 1)

#define	PRI_USER_RT		128
#define	NPRI_USER_RT		64
#define	MAXPRI_USER_RT		(PRI_USER_RT + NPRI_USER_RT - 1)

#define	PRI_KTHREAD		96
#define	NPRI_KTHREAD		32
#define	MAXPRI_KTHREAD		(PRI_KTHREAD + NPRI_KTHREAD - 1)

#define	PRI_KERNEL		64
#define	NPRI_KERNEL		32
#define	MAXPRI_KERNEL		(PRI_KERNEL + NPRI_KERNEL - 1)

#define	PRI_USER		0
#define	NPRI_USER		64
#define	MAXPRI_USER		(PRI_USER + NPRI_USER - 1)

/* Priority range used by POSIX real-time features */
#define	SCHED_PRI_MIN		0
#define	SCHED_PRI_MAX		63

/*
 * Kernel thread priorities.
 */
#define	PRI_SOFTSERIAL	MAXPRI_KERNEL_RT
#define	PRI_SOFTNET	(MAXPRI_KERNEL_RT - schedppq * 1)
#define	PRI_SOFTBIO	(MAXPRI_KERNEL_RT - schedppq * 2)
#define	PRI_SOFTCLOCK	(MAXPRI_KERNEL_RT - schedppq * 3)

#define	PRI_XCALL	MAXPRI_KTHREAD
#define	PRI_PGDAEMON	(MAXPRI_KTHREAD - schedppq * 1)
#define	PRI_VM		(MAXPRI_KTHREAD - schedppq * 2)
#define	PRI_IOFLUSH	(MAXPRI_KTHREAD - schedppq * 3)
#define	PRI_BIO		(MAXPRI_KTHREAD - schedppq * 4)

#define	PRI_IDLE	PRI_USER
/***********************END SYS/PARAM.H*****************************/