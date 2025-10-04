FROM ubuntu:24.04

# Install dependencies and fonts
RUN apt-get update && apt-get install -y \
    curl \
    xz-utils \
    unzip \
    fonts-roboto \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# Install Font Awesome 7 (desktop version with OTF files)
ARG FONTAWESOME_VERSION=7.0.1
RUN curl -fsSL "https://github.com/FortAwesome/Font-Awesome/releases/download/${FONTAWESOME_VERSION}/fontawesome-free-${FONTAWESOME_VERSION}-desktop.zip" \
    -o fontawesome.zip \
    && unzip -q fontawesome.zip \
    && mkdir -p /usr/share/fonts/opentype/fontawesome \
    && cp fontawesome-free-${FONTAWESOME_VERSION}-desktop/otfs/*.otf /usr/share/fonts/opentype/fontawesome/ \
    && rm -rf fontawesome.zip fontawesome-free-${FONTAWESOME_VERSION}-desktop \
    && fc-cache -fv

# Install Typst
ARG TYPST_VERSION=0.12.0
RUN curl -fsSL "https://github.com/typst/typst/releases/download/v${TYPST_VERSION}/typst-x86_64-unknown-linux-musl.tar.xz" \
    -o typst.tar.xz \
    && tar -xf typst.tar.xz \
    && mv typst-x86_64-unknown-linux-musl/typst /usr/local/bin/ \
    && rm -rf typst.tar.xz typst-x86_64-unknown-linux-musl

WORKDIR /resume

# Copy the resume files
COPY . .

# Default command: compile the CV
CMD ["typst", "compile", "cv.typ", "cv.pdf"]
