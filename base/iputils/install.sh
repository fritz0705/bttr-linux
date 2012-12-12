#!/bin/bash

cd $1

install -dm755 ${DESTDIR}/${PREFIX}/{bin,sbin}
install -m755 arping clockdiff rarpd rdisc tftpd tracepath tracepath6 ${DESTDIR}/${PREFIX}/sbin
install -m755 ping{,6} ${DESTDIR}/${PREFIX}/bin/

if [ "${PREFIX}" = "/usr" ]
then
	install -dm755 ${DESTDIR}/bin
	ln -sf ${PREFIX}/ping{,6} ${DESTDIR}/bin/
fi

