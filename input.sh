#!/bin/bash

##############################################################
# Script Description: This script helps in building the .env file by -
#  Taking the inputs for environment variables required for the MERN application one by one from the user and writing them to the .env file at the correct place.
# The script control does not end until all the required variables are taken from the user.
# For any variable, the user can attempts for three times in case of wrong input (for every wrong input an appropriate message is displayed) before the script exits with an error message.
# If this script ends without success, then the .env file will not be created/modified and the docker compose command will fail to run the MERN application.
##############################################################

# Function to prompt for input and validate
prompt_for_input() {
    local var_name=$1
    local prompt_message=$2
    local attempt=0
    local max_attempts=3
    local input_value=""
    while [ $attempt -lt $max_attempts ]; do
        read -p "$prompt_message: " input_value
        if [ -n "$input_value" ]; then
            echo "$var_name=$input_value" >> .env
            return 0
        else
            echo "Invalid input. Please try again."
            attempt=$((attempt + 1))
        fi
    done
    echo "Maximum attempts reached for $var_name. Exiting."
    exit 1
}   
# Clear existing .env file or create a new one
touch .env
# Prompt for each required environment variable

prompt_for_input "PORT" "Enter Port For The Backend (PORT)"
prompt_for_input "NODE_ENV" "Enter Node Environment (NODE_ENV)"
prompt_for_input "MONGO_URL" "Enter MongoDB Connection String (MONGO_URL)"
prompt_for_input "JWT_SECRET" "Enter JWT Secret (JWT_SECRET)"
prompt_for_input "JWT_EXPIRY" "Enter JWT Expiry (JWT_EXPIRY)"
prompt_for_input "CLOUD_NAME" "Enter Cloudinary Cloud Name (CLOUD_NAME)"
prompt_for_input "CLOUD_API_KEY" "Enter Cloudinary API Key (CLOUD_API_KEY)"
prompt_for_input "CLOUD_API_SECRET" "Enter Cloudinary API Secret (CLOUD_API_SECRET)"  
echo ".env file created successfully."
exit 0

