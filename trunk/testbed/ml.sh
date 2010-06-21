#! /bin/sh -x

src="hexdump.c hexdump-conv.c hexdump-display.c hexdump-parse.c hexdump-odsyntax.c hexsyntax.c err.c errx.c warn.c warnx.c verr.c verrx.c vwarn.c vwarnx.c"

for f in $src
do
 obj=$(echo $f | sed 's/c$/o/')
 gcc -o $obj -g -I. -DTESTING=1 -c $f
 if [ $? -ne 0 ]; then
  exit 1
 fi
done

gcc -o hd $(echo $src | sed 's/\.c/\.o/g')
