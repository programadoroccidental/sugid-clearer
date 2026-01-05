PROG = sugid-clearer
PREFIX = /usr
DESTDIR =

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(PROG) $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(PROG)
	mkdir -p $(DESTDIR)/etc/sugid-clearer
	chmod 700 $(DESTDIR)/etc/sugid-clearer
	cp -f sugid_files.txt $(DESTDIR)/etc/sugid-clearer
	chmod 600 $(DESTDIR)/etc/sugid-clearer/sugid_files.txt

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROG)
	rm -rf $(DESTDIR)/etc/sugid-clearer

GPGKEY ?= 9635F79DD28A4A2D42385AD1D2FDE81DBBAFBE5C
archive:
	git archive --format=tar.gz --prefix=$(PROG)-$(VERSION)/ -o $(PROG)-$(VERSION).tar.gz v$(VERSION)
	gpg --armor --detach-sig --default-key $(GPGKEY) $(PROG)-$(VERSION).tar.gz
	gpg --verify $(PROG)-$(VERSION).tar.gz.asc

.PHONY: install uninstall archive
