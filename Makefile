# will not be supported: chio db mt 

#PROJECTS = bdes \
  compatlib compress csh \
  db df doc \
  ksh mk ps rcmd rcp \
  sh sync

PROJECTS  =	apply awk/bin banner basename cat chmod cleantags \
  cmp col colrm comm cp csplit \
  ctags cut deroff dd dirname \
  domainname echo \
  ed env error \
  expand expr false hostname kill \
  ln ls mkdir mv pax pwd rm rmdir sleep stty testcmd

MKC_CHECK_HEADERS = tzfile.h md2.h db.h

.include <mkc.configure.mk>

.if ${HAVE_HEADER.tzfile_h:U} == 1
PROJECTS += cal
PROJECTS += calendar
PROJECTS += date
.endif

.if ${HAVE_HEADER.md2_h:U} == 1
PROJECTS += cksum
.endif

.if ${HAVE_HEADER.db_h:U} == 1
PROJECTS += db
.endif

LIBDEPS   =	${PROJECTS:S/^/compatlib:/}

MKC_REQD  =	0.29.1
COMPATLIB =	compatlib

.include <mkc.mk>
