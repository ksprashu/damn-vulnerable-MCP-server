#!/bin/bash
set -e

# Check if gcloud is installed
if ! [ -x "$(command -v gcloud)" ]; then
  echo 'Error: gcloud is not installed.' >&2
  exit 1
fi

# Check if project is set
if [ -z "$(gcloud config get-value project)" ]; then
  echo "Error: gcloud project is not set. Please run 'gcloud config set project [PROJECT_ID]'" >&2
  exit 1
fi

# Submit the build to Google Cloud Build and run it in the background
echo "Submitting build to Google Cloud Build..."
echo "You can monitor the build progress in the Google Cloud Console:"
echo "https://console.cloud.google.com/cloud-builds"

gcloud builds submit . --async