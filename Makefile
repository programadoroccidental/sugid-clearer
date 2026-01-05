PROG = sugid-clearer
PREFIX = /usr
DESTDIR =

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m0755 $(PROG) $(DESTDIR)$(PREFIX)/bin
	install -dm700 $(DESTDIR)/etc/sugid-clearer
	install -m600 sugid_files.txt $(DESTDIR)/etc/sugid-clearer

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/$(PROG) \
		$(DESTDIR)/etc/sugid-clearer

GPGKEY ?= 9635F79DD28A4A2D42385AD1D2FDE81DBBAFBE5C
archive:
	git archive --format=tar.gz --prefix=$(PROG)-$(VERSION)/ -o $(PROG)-$(VERSION).tar.gz v$(VERSION)
	gpg --armor --detach-sig --default-key $(GPGKEY) $(PROG)-$(VERSION).tar.gz
	gpg --verify $(PROG)-$(VERSION).tar.gz.asc

.PHONY: install uninstall archive
