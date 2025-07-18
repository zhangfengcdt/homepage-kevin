#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
SOURCE_DIR="./"
DEST_BUCKET="s3://kevin-homepage/"
AWS_PROFILE="personal"

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install it and try again."
        exit 1
    fi
}

# Function to deploy files to S3
deploy_to_s3() {
    echo "Starting deployment to S3 bucket: $DEST_BUCKET"
    aws s3 sync "$SOURCE_DIR" "$DEST_BUCKET" --profile "$AWS_PROFILE"
    echo "Deployment completed successfully."
}

# Main script execution
check_aws_cli
deploy_to_s3
