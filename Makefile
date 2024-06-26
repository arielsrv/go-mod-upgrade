golangci-lint = ./bin/golangci-lint
goreleaser = ./bin/goreleaser

$(golangci-lint):
	curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s v1.56.2

$(goreleaser):
	curl -sfL https://goreleaser.com/static/run | sh

# Lint the source code
lint: $(golangci-lint)
	@echo "Running golangci-lint..."
	@go list -f '{{.Dir}}' ./... \
		| xargs $(golangci-lint) run
.PHONY: lint

# Release a new version
release: $(goreleaser)
	$(goreleaser) --clean
.PHONY: release
