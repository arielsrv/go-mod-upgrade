goreleaser = ./bin/goreleaser

$(goreleaser):
	curl -sfL https://install.goreleaser.com/github.com/goreleaser/goreleaser.sh | sh

# Release a new version
release: $(goreleaser)
	$(goreleaser) --clean
.PHONY: release
