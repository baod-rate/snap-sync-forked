# snap-sync
# https://github.com/wesbarnett/snap-sync
# Copyright (C) 2016-2018 Wes Barnett

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,

PKGNAME = snap-sync
PREFIX ?= /usr
SNAPPER_CONFIG ?= /etc/sysconfig/snapper

BIN_DIR = $(DESTDIR)$(PREFIX)/bin
SHARE_DIR = $(DESTDIR)$(PREFIX)/share

.PHONY: install

install:
	@./find_snapper_config || sed -i 's@^SNAPPER_CONFIG.*@SNAPPER_CONFIG='$(SNAPPER_CONFIG)'@g' bin/$(PKGNAME)
	@install -Dm644 LICENSE -t $(SHARE_DIR)/licenses/$(PKGNAME)/
	@install -Dm644 README.md -t $(SHARE_DIR)/doc/$(PKGNAME)/
	@install -Dm644 man8/* -t $(SHARE_DIR)/man/man8/
	@install -Dm755 bin/* -t $(BIN_DIR)/
