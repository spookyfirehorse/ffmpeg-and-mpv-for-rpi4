CRX_SOURCES=crx/manifest.json crx/background.js crx/content_script.js crx/shim.js crx/icon48.png crx/icon128.png
GPSPIPEW_SOURCES=gpspipew/au.id.micolous.gpspipe.json gpspipew/gpspipew.py gpspipew/install.sh

.PHONY: clean

all: $(CRX_SOURCES) gpsd-chrome-polyfill.zip

clean:
	rm -f gpsd-chrome-polyfill.zip

gpsd-chrome-polyfill.zip: $(CRX_SOURCES)
	zip -j9 $@ $(CRX_SOURCES)

install: $(GPSPIPEW_SOURCES)
	./gpspipew/install.sh -s

