DEB_EXTILITY_VERSION ?= 0.0.0-devtree
CURRENT_VERSION := $(DEB_EXTILITY_VERSION)

all:
	/bin/rm -rf build
	mkdir -p build
	tar -cf - external-fdl | tar -C build -xf -
	tar -cf - plugins | tar -C build -xf -
	find build/external-fdl -name '*.lua' -type f -print0 | xargs -0 -r perl -p -i -e '$$v='"'$(CURRENT_VERSION)'"';s/\@VERSION\@/$$v/g;'

clean:
	/bin/rm -rf build
