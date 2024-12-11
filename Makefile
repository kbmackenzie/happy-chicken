NAME   := happy-chicken
SCRIPT := src/happy-chicken.awk
PREFIX ?= $(HOME)/.local/bin

lint:
	awk --lint -f $(SCRIPT) <<< ""

test:
	./test.sh

install:
	chmod +x $(SCRIPT)
	cp $(SCRIPT) $(PREFIX)/$(NAME)

uninstall:
	[ -f $(PREFIX)/$(NAME) ] && rm $(PREFIX)/$(NAME)

install-gawk:
	chmod +x $(SCRIPT)
	sed -e '1s/awk/gawk/' $(SCRIPT) > ./$(NAME)
	mv ./$(NAME) $(PREFIX)/$(NAME)

.PHONY: lint test install uninstall
