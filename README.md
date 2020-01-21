# gcssyncbucket
Syncs all files from a folder from a Google Cloud Storage bucket to local folder

Environment variables:

BUCKET_NAME - The name of the Google Cloud Storage bucket

BUCKET_PATH - An optional subfolder in the bucket from which to copy files

DESTINATION_PATH - The destination folder where to copy files

Example:

docker run --rm -e BUCKET_NAME=test-bucket -e BUCKET_PATH=data -e DESTINATION_PATH=/data yncog/syncbucket
