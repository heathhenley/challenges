# Install the latest ocaml and opam image
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    gcc \
    git \
    sudo

RUN useradd -m -s /bin/bash user
USER user

# Install dune using the installer script
RUN curl -fsSL https://get.dune.build/install | sh -

ENV PATH="/home/user/.local/bin:${PATH}"

# Set up a working directory
WORKDIR /workspace

SHELL ["/bin/bash", "-l", "-c"]