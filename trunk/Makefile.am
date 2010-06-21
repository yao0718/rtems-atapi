#
#  $Id: Makefile,v 1.3 2006/09/12 13:51:55 joel Exp $
#

#
# Used by bootstrap to handle this.
#
ACLOCAL_AMFLAGS = -I aclocal

#
# Access the BSP configuration.
#
include $(srcdir)/automake/bsp-compile.am

#
# List the programs we want to build.
#
bin_PROGRAMS = \
	filesystem-test

#
# Include the PC586 GDB remote stub support.
#
if PC586
PC586_GDB = pc386-gdb.c
PC586_SRC = \
	$(PC586_GDB)
LIBBSDPORT = -lif_re -lif_fxp -lbsdport
endif

#
# BSD Source
#
bsd_SOURCE = \
	src/systm.c

#
# ATAPI Source
#
atapi_SOURCE = \
	atapi/ata.c


#
# List the C Application sources, cflags and linker options.
#
filesystem_test_CFLAGS = -g -Wall -Wimplicit-function-declaration -Wstrict-prototypes \
                         -Wnested-externs -fasm 

filesystem_test_SOURCES = \
	init.c \
	main.c \
	$(atapi_SOURCE) \
	$(bsd_SOURCE) \
	$(PC586_SRC)

filesystem_test_LDADD = \
	$(LIBBSDPORT) -lrtemsbsp -lrtemscpu -lnfs


all-local: \
	filesystem-test.ralf


all-local: \
	.gdbinit

.gdbinit: $(srcdir)/@RTEMS_BSP@-gdbinit-script
	cp $(srcdir)/@RTEMS_BSP@-gdbinit-script .gdbinit

#
# Access the BSP post link commands.
#
include $(srcdir)/automake/bsp-post-link.am
