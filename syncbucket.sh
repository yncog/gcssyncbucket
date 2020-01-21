#!/bin/sh

set -e

mkdir -p "${MOUNT_PATH}"
mkdir -p "${DESTINATION_PATH}"

gcsfuse $BUCKET_NAME "${MOUNT_PATH}"

SRC_PATH="${MOUNT_PATH}"

if [ -n "${BUCKET_PATH}" ]; then
    SRC_PATH="${SRC_PATH}/${BUCKET_PATH}"
fi
cp -avr "${SRC_PATH}"/* "${DESTINATION_PATH}"

fusermount -u "${MOUNT_PATH}"