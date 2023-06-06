#!/bin/bash

deb_folder=deb
mkdir -p $deb_folder
# Fetching latest version of chrome-beta deb package
wget -q -O ${deb_folder}/beta.deb https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb
# Extract version
version_downloaded=$( dpkg-deb -I deb/beta.deb | sed -n -e 's/\sVersion:.* //p' )
mv ${deb_folder}/beta.deb ${deb_folder}/google-chrome-beta_${version_downloaded}_amd64.deb
