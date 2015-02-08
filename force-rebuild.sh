#!/bin/sh

export TZ=UTC
DATE=$(date +%Y%m%d-%H%M%S)

echo $DATE > last-force-rebuild
git add last-force-rebuild
git commit -m "Forcing rebuild on $DATE"

