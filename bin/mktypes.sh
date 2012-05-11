#!/bin/sh

PREFIX="${HOME}/src/work/igc"

DIRS="
	${PREFIX}/sdal_ivc/trl
	${PREFIX}/sdal_ivc/nt_*
	${PREFIX}/sdal_ivc/sdal
	${PREFIX}/sdal_ivc/igc_clog
	${PREFIX}/sdal_ivc/msgpack
	${PREFIX}/sdal_ivc/igc_protocol
	${PREFIX}/sdal_ivc/igc_serializer
	${PREFIX}/igc_osal"

FILES="`find ${DIRS} -name \"*.h\" -o -name \"*.c\" -o -name \"*.m\"`"

#SYS_FILES="/usr/include/*.h /usr/include/sys/*.h /usr/include/malloc/*.h /usr/include/arpa/*.h /usr/include/net/*.h /usr/include/machine/*.h /usr/include/netinet/*.h"

CTAGS="ctags --sort=yes -o-"
OUTPUT="${HOME}/src/types.vim"

#${CTAGS} ${FILES} ${SYS_FILES} > tags

${CTAGS} --c-kinds=gtu ${FILES} | awk 'BEGIN{printf("syntax keyword Type\t")}      {printf("%s ", $1)}END{print ""}' >  ${OUTPUT}
${CTAGS} --c-kinds=fp  ${FILES} | awk 'BEGIN{printf("syntax keyword Function\t")}  {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
${CTAGS} --c-kinds=m   ${FILES} | awk 'BEGIN{printf("syntax keyword UserField\t")} {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
${CTAGS} --c-kinds=ed  ${FILES} | awk 'BEGIN{printf("syntax keyword Define\t")}    {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}

#${CTAGS} --c-kinds=gtu ${EXT_FILES} | awk 'BEGIN{printf("syntax keyword Type\t")}  {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
#${CTAGS} --c-kinds=fp  ${EXT_FILES} | awk 'BEGIN{printf("syntax keyword Function\t")}  {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
#${CTAGS} --c-kinds=m   ${EXT_FILES} | awk 'BEGIN{printf("syntax keyword UserExtField\t")} {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
#${CTAGS} --c-kinds=ed  ${EXT_FILES} | awk 'BEGIN{printf("syntax keyword Define\t")}   {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}

#${CTAGS} --c-kinds=gtu ${SYS_FILES} | awk 'BEGIN{printf("syntax keyword Type\t")}  {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
#${CTAGS} --c-kinds=fp  ${SYS_FILES} | awk 'BEGIN{printf("syntax keyword Function\t")}  {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
#${CTAGS} --c-kinds=m   ${SYS_FILES} | awk 'BEGIN{printf("syntax keyword UserSysField\t")} {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}
#${CTAGS} --c-kinds=ed  ${SYS_FILES} | awk 'BEGIN{printf("syntax keyword Define\t")}   {printf("%s ", $1)}END{print ""}' >> ${OUTPUT}

