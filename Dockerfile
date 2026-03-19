# --- VERSIONS ---
ARG FEDORA_VERSION=43
# Fedora 43 has sccache, but none with S3 storage support
ARG TYPST_VERSION=0.14.2

ARG DNF_COMMAND="dnf --setopt=install_weak_deps=False -q"
FROM fedora:${FEDORA_VERSION}
ARG TYPST_VERSION
ARG DNF_COMMAND

LABEL maintainer="mmueller@gnuradio.org"
RUN ${DNF_COMMAND} install --refresh -y \
        cargo \
        openssl-devel \
        && ${DNF_COMMAND} clean all

RUN cargo install \
        --locked \
        --quiet \
        --root / \
        typst-cli@${TYPST_VERSION}

