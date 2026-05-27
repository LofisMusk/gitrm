#!/usr/bin/env bash

set -e

BINARY_NAME="gitrm"
INSTALL_PATH="$HOME/.local/bin"
DATA_PATH="$HOME/.local/share/$BINARY_NAME"

mkdir -p "$DATA_PATH"
if [ ! -d "$DATA_PATH/.venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv "$DATA_PATH/.venv"
fi

source "$DATA_PATH/.venv/bin/activate"

echo "Installing requirements..."

pip install --upgrade pip
pip install -r requirements.txt

echo "Deploying script files to $DATA_PATH..."
cp -r src/* "$DATA_PATH/"

echo "Creating launcher wrapper in $INSTALL_PATH..."
mkdir -p "$INSTALL_PATH"

cat <<EOF >"$INSTALL_PATH/$BINARY_NAME"
#!/usr/bin/env bash
source "$DATA_PATH/.venv/bin/activate"
python3 "$DATA_PATH/gitrm.py" "\$@"
EOF

chmod +x "$INSTALL_PATH/$BINARY_NAME"

echo "Setup finished!"
