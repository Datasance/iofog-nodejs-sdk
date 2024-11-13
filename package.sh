#!/usr/bin/env sh
#
# Package.sh is a simple script that creates a distribution tarball from the files and folders in this repo that
# we want to ship to customers. These files are defined in 'distro-list.txt'.
#

VERSION="3.0.1"

echo "Datasance ioFog node-js sdk Packaging"
echo "Beginning packaging process"

# echoInfo "Building application bundle"
# npm run build

# This is what we want to call our distro
DISTRO_NAME="datasance-iofog-nodejs-sdk-${VERSION}.tgz"
# Clean away any previous distro
if [ -f ${DISTRO_NAME} ]; then
    echo "Removing old Distro file"
    rm ${DISTRO_NAME}
fi

echo "Building production app"
npm run standard 
npm pack

echo "Distro packaging complete!"

echo "Publishing package!"
npm publish ${DISTRO_NAME} --access public


