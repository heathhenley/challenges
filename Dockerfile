# Install the latest ocaml and opam image
FROM ocaml/opam:debian-ocaml-5.3

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    pkg-config \
    libev-dev \
    libevent-dev

# Install dune using the installer script
USER opam
RUN opam install ocaml-lsp-server odoc ocamlformat utop

ENV PATH="/home/opam/.local/bin:${PATH}"

# Set up a working directory
WORKDIR /challenges

# install the project dependencies
RUN opam install . --deps-only --working-dir

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"] 