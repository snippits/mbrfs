.PHONY: force

CFLAGS = $(shell pkg-config fuse --cflags)
LDFLAGS = $(shell pkg-config fuse --libs)

all: mbrfs

mbrfs: mbrfs.c
	$(CC) $< $(CFLAGS) $(LDFLAGS) -o $@

test: force
	./mbrfs test.img -f test

install: mbrfs
	install -Dm 0755 mbrfs $(DESTDIR)/bin/mbrfs

clean:
	rm -f mbrfs
