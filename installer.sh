#!/bin/sh

#       (     )
REPO_USER="your-github-username"
REPO_NAME="your-repo-name"
BRANCH="main" #  master    

#       Enigma2
TEMP_DIR="/tmp/panel_install"
PLUGIN_DIR="/usr/lib/enigma2/python/Plugins/Extensions/YourPanelName"

echo "=================================================="
echo "          Starting Installation of Panel          "
echo "=================================================="

# 1.  Enigma2     ()
# killall -9 enigma2

# 2.   
mkdir -p $TEMP_DIR
mkdir -p $PLUGIN_DIR

echo "[*] Downloading files from GitHub..."

# 3.     wget  curl
if command -v wget > /dev/null; then
    wget -q --no-check-certificate https://github.com/$REPO_USER/$REPO_NAME/archive/refs/heads/$BRANCH.tar.gz -O $TEMP_DIR/panel.tar.gz
elif command -v curl > /dev/null; then
    curl -sL https://github.com/$REPO_USER/$REPO_NAME/archive/refs/heads/$BRANCH.tar.gz -o $TEMP_DIR/panel.tar.gz
else
    echo "Error: Neither wget nor curl is installed!"
    exit 1
fi

echo "[*] Extracting files..."
tar -xzf $TEMP_DIR/panel.tar.gz -C $TEMP_DIR

# 4.       
# (:          )
cp -rf $TEMP_DIR/$REPO_NAME-$BRANCH/* $PLUGIN_DIR/

# 5.   
rm -rf $TEMP_DIR

echo "[*] Setting permissions..."
chmod -R 755 $PLUGIN_DIR

echo "=================================================="
echo "          Installation Completed Successfully!    "
echo "=================================================="
echo "Please restart your Enigma2 GUI (Restart GUI)."

#     2  ()
# killall -9 enigma2
