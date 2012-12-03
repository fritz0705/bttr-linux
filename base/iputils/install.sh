#!/bin/bash

cd $1
DESTDIR=${DESTDIR:-$2}
PREFIX=${PREFIX:-$3}

install -dm755 ${DESTDIR}/${PREFIX}/{bin,sbin} ${DESTDIR}/bin
install -m755 arping clockdiff rarpd rdisc tftpd tracepath tracepath6 ${DESTDIR}/${PREFIX}/sbin
install -m755 ping{,6} ${DESTDIR}/${PREFIX}/bin/
ln -sf ${PREFIX}/ping{,6} ${DESTDIR}/bin/

#install -dm755 ${DESTDIR}/${PREFIX}/share/man/man8
#install -m644 doc/{arping,clockdiff,ping,rarpd,rdisc,tftpd,tracepath}.8 ${DESTDIR}/${PREFIX}/share/man/man8/

#ln -sf ping.8.gz ${DESTDIR}/${PREFIX}/share/man/man8/ping6.8.gz
#ln -sf tracepath.8.gz ${DESTDIR}/${PREFIX}/share/man/man8/tracepath6.8.gz

