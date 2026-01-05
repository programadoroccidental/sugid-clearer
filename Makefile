PROG = sugid-clearer
PREFIX = /usr/local

install:
	mkdir -p $(PREFIX)/bin
	cp -f $(PROG) $(PREFIX)/bin
	chmod 755 $(PREFIX)/bin/$(PROG)
	mkdir -p /etc/sugid-clearer
	chmod 700 /etc/sugid-clearer
	cp -f sugid_files.txt /etc/sugid-clearer
	chmod 600 /etc/sugid-clearer/sugid_files.txt

uninstall:
	rm -f $(PREFIX)/bin/$(PROG)
	rm -rf /etc/sugid-clearer

GPGKEY ?= 9635F79DD28A4A2D42385AD1D2FDE81DBBAFBE5C
archive:
	git archive --format=tar.gz --prefix=$(PROG)-$(VERSION)/ -o $(PROG)-$(VERSION).tar.gz v$(VERSION)
	gpg --armor --detach-sig --default-key $(GPGKEY) $(PROG)-$(VERSION).tar.gz
	gpg --verify $(PROG)-$(VERSION).tar.gz.asc

.PHONY: install uninstall archive
