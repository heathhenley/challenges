# Install the latest ocaml and opam image
FROM ocaml/opam:debian-ocaml-5.3

RUN sudo apt-get update && sudo apt-get install -y \
  libev-dev \
  pkg-config \
  libgmp-dev \
  libssl-dev \
  jq

# Set up a working directory
WORKDIR /workspace

SHELL ["/bin/bash", "-l", "-c"]

EXPOSE 8080

# Install OCaml dependencies
RUN opam install ocaml-lsp-server odoc ocamlformat utop