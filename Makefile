VERSION := 1
PK3_NAME := respawn-timer-mod-v$(VERSION).pk3

ACCFLAGS :=

.PHONY: all clean

all: $(PK3_NAME)

$(PK3_NAME): LOADACS CVARINFO README.md acs/respawn-timer-mod.o
	zip $@ $^

acs/%.o: %.acs
	if [[ ! -d acs ]]; then mkdir acs; fi
	acc $(ACCFLAGS) $< $@

clean:
	rm $(PK3_NAME) acs/respawn-timer-mod.o
