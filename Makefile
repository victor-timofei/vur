MAKEPKG=makepkg
PKGS=gdb-multiarch

.PHONY: all
all: build-$(PKGS)

.PHONY: install-all
install-all: install-$(PKGS)

.PHONY: build-$(PKGS)
build-$(PKGS): $(PKGS)/PKGBUILD
	@cd `echo $@ | sed 's/build-//'` && \
		$(MAKEPKG) -s

.PHONY: install-$(PKGS)
install-$(PKGS):
	@cd `echo $@ | sed 's/install-//'` && \
		$(MAKEPKG) -i

.PHONY: clean
clean:
	@sudo rm -rf ./*/pkg
	@rm -rf ./*/src
	@rm -rf ./*/*.sig
	@rm -rf ./*/*.tar.xz
	@rm -rf ./*/*.zst
