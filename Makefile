PREFIX := /usr/local

#install by default
all: install

install:
	# copies muxsh file to /usr/local/bin/muxsh, which should be in path
	cp muxsh $(DESTDIR)$(PREFIX)/bin/muxsh
	# marks muxsh as executable
	chmod 0755 $(DESTDIR)$(PREFIX)/bin/muxsh

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/muxsh

.PHONY: all install uninstall
