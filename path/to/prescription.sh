#!/bin/bash

# Synopsys Intelligent Security Scan

# Copyright 2016-2020 Synopsys, Inc. All rights reserved worldwide.

# Check if IO_SERVER_URL is null
if [ -z "$IO_SERVER_URL" ]; then
  # Set a default value or handle the error gracefully
  IO_SERVER_URL="https://default-url.com"
fi

# Current Stage is set to IO
echo "Current Stage is set to IO"

# Trigger prescription
echo "Triggering prescription"

# Download prescription.sh file
wget -O prescription.sh https://sigdevsecops.blob.core.windows.net/intelligence-orchestration/2021.01/prescription.sh

# Check if the download was successful
if [ $? -eq 0 ]; then
  echo "Prescription file downloaded successfully"
else
  echo "Failed to download prescription file"
  exit 1
fi

# Continue execution even if IO_SERVER_URL is null
echo "IO_SERVER_URL value is $IO_SERVER_URL"

# Execute the downloaded prescription.sh file
bash prescription.sh

# Handle any potential errors
if [ $? -eq 0 ]; then
  echo "Execution completed successfully"
else
  echo "Execution failed with error code $?"
fi
