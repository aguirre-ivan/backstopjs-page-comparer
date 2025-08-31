#!/bin/bash
set -e

CMD=$1

IMAGE="backstopjs/backstopjs:6.3.25"
CONFIG="backstop.js"
SCENARIOS="scenarios.json"

if [ ! -f "$SCENARIOS" ]; then
	echo "Error: Scenarios file '$SCENARIOS' not found."
	echo "Make sure $SCENARIOS exists in the current directory."
	exit 1
fi

if [ ! -f "$CONFIG" ]; then
	echo "Error: Config file '$CONFIG' not found."
	echo "Make sure $CONFIG exists in the current directory."
	exit 1
fi

echo "⚡ Generating references..."
docker run --rm -it -v "$(pwd):/src" $IMAGE reference --configPath=$CONFIG

echo "⚡ Running tests..."
docker run --rm -it -v "$(pwd):/src" $IMAGE test --configPath=$CONFIG || true

echo "⚡ Opening report..."
xdg-open backstop_data/html_report/index.html