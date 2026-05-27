#!/usr/bin/env bash

set -e

BINARY_NAME="gitrm"
INSTALL_PATH="$HOME/.local/bin"
DATA_PATH="$HOME/.local/share/$BINARY_NAME"

echo "Removing gitrm..."
rm "$INSTALL_PATH/$BINARY_NAME"
rm -rf "$DATA_PATH"

echo "Done"
