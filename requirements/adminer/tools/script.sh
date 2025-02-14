#!/bin/sh

# Ensure the /var/www/html directory exists
mkdir -p /var/www/html

# Navigate to the directory
cd /var/www/html || exit 1

# Download Adminer and check if the download was successful
wget -q --show-progress --retry-connrefused --waitretry=2 --tries=5 \
    https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# Verify the file exists before renaming
if [ -f "adminer-4.8.1.php" ]; then
    mv adminer-4.8.1.php adminer.php
    echo "Adminer downloaded successfully."
else
    echo "Failed to download Adminer. Exiting."
    exit 1
fi


exec php -S 0.0.0.0:8080




