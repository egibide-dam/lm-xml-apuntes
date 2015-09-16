#!/bin/sh

ARCHIVOS="markdown/[10-50]*.md"

pandoc -s -S --toc \
--epub-cover-image=recursos/cover.png \
--epub-stylesheet=recursos/estilos.css \
--highlight-style=haddock \
--toc-depth=3 \
-f markdown \
-t epub3 \
-o build/xml.epub \
recursos/metadata.yml \
$ARCHIVOS
