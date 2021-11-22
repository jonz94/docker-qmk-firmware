ifeq ($(OS),Windows_NT)
    SHELL = cmd.exe
    VERSION = $(shell type VERSION)
else
    VERSION = $(shell cat VERSION)
endif

release:
	@sed -i "s/^ENV QMK_FIRMWARE_VERSION=.*$$/ENV QMK_FIRMWARE_VERSION=$(VERSION)/" Dockerfile
	@git add -A
	@git commit -m "🎉 release: version $(VERSION)"
	@git tag -a $(VERSION) -m "🎉 release: version $(VERSION)"
	@git push --all
	@git push --tags
