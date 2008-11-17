gits.1: gits
	pod2man < $^ > $@

install: gits gits.1 README
	mkdir -p /usr/local/share/man/man1
	install -m 444 gits.1 /usr/local/share/man/man1
	VERSION=`./gits --version`; \
	 sed "s/{UNTAGGED}/$${VERSION}/" gits > /usr/local/bin/gits
	chmod 755 /usr/local/bin/gits
	@perl -MTerm::ProgressBar -e 1 &>/dev/null || echo Warning: Missing optional Term::ProgressBar
	@perl -MParallel::Iterator -e 1 &>/dev/null || echo Warning: Missing optional Parallel::Iterator package

README: gits
	pod2text < gits > README

clean nuke:
	rm -rf gits.1 checkdir *~ core* \#*

check test:
	./prep_gitscheck
