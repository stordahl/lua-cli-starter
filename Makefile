# lua cli starter
#
# Replace all instances of `app` with your cli's root command
#
# Luastatic command line tool is a prerequisite for this build process
# https://github.com/ers35/luastatic

.PHONY: build

build:
	rm -rf build
	mkdir build
	luastatic \
		src/app.lua \
		$$(brew --prefix lua)/lib/liblua.a -I$$(brew --prefix lua)/include/lua \
		-o build/app
	mv app.luastatic.c build/

install: build
	sudo cp build/app /usr/local/bin

uninstall:
	sudo rm /usr/local/bin/app
