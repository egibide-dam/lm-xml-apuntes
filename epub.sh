#!/bin/sh

COMMIT=`git rev-parse --short HEAD`
sed "s/\.\.\./identifier: Versión $COMMIT/g" recursos/metadata.yml > build/metadata.temp
echo "..." >> build/metadata.temp

ARCHIVOS="markdown/[10-50]*.md"

pandoc -s -S --toc \
--epub-cover-image=recursos/cover.png \
--epub-stylesheet=recursos/estilos.css \
--highlight-style=haddock \
--toc-depth=3 \
-f markdown \
-t epub3 \
-o build/xml.epub \
build/metadata.temp \
$ARCHIVOS

rm build/metadata.temp
