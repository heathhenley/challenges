.PHONY: build
build:
	dune build

.PHONY: run
run:
	dune exec api

.PHONY: test
test:
	dune runtest

.PHONY: clean
clean:
	dune clean

.PHONY: deps
deps:
	opam install . --deps-only --with-test -y

.PHONY: doc
doc:
	dune build @doc

.PHONY: watch
watch:
	dune exec api --watch

.DEFAULT_GOAL := build